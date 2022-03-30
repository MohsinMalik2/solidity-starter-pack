pragma solidity >=0.7.0 <0.9.0;

// A contract about grand fathers will . Who's goin to die and want to decide the distribution og his ethers.


contract will{
    address owner;
    uint fortune;
    bool deceased;

    // payable another global keyword use to allow function to send and recieve ether (data exchangeb or change in form of ethers)

    constructor () payable {
        owner  = msg.sender; //msg.sender represents the person calling the function
        fortune = msg.value; // represents the amount of ether sent
        deceased = false; //imagining grand father's the first one to initiate the contract so he's not dead yet.
    }


    //In solidity modifiers use to add some extra logic to the main functions

    //A modifier to confirm the owner will be the only person can call this contract

    modifier onlyOwner {
        require(msg.sender == owner);
        _; //_ use to let the work continue after condition get accepted in solidity
    }

    //Another modifier to make sure smart contract only called when owner deceased 

    modifier isDeceased {
        require(deceased == true);
        _; //_ use to let the work continue after condition get accepted in solidity
    }

    //Now we need to have a list of family member's wallets so that contract can deposit 
    //their share as soon as upper modifiers turn on

    //For the list we are using array  address type as we want to store addresses of wallets 
    // and payable because we need ether to transfer

    address payable [] familyWallets;

    //To differentiate between familywallet adresses and tell the system which 
    // address will get what amount we need to add key values with each address

    //And Like other languages to implement keys in array we use mapping

    mapping (address => uint) inheritance;  //inheritance is just a name

    //Set inheritance for each wallet

    function setInheritance(address payable wallet, uint amount) public onlyOwner {

        // to add wallets to the family wallet

        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    //Pay each family member according to their wallet address

    function payOuts() private isDeceased  {
            for(uint i=0;i<familyWallets.length;i++){

                //Transfering amount now using transfer method which'll have a perameter of amount to be transfered

                familyWallets[i].transfer(inheritance[familyWallets[i]]);

            }
    }

    //Oracel switch Simmulation (to trigger the payout function) 

    function dead () payable public onlyOwner {
        deceased = true;
        payOuts();

    }
     
}