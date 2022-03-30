pragma solidity >=0.7.0 <0.9.0;


//First own cryptocoin 

//FUnctionalities of this smart contract will be:
//1. We'll be the only one who can make the coin (onlyowner can make new coins)
//2. Others don't have to register theirselves to send or recieve coins, only thing needed is their ethereum keypairs.


contract musecoin{


    address public minter; //Owner ethereum address 
    mapping(address => uint) public balance; // transactors ethereum keypairs

    //event keyword to emit the sent event  

    event Sent(address from, address to, uint amount);

    constructor (){
        minter = msg.sender;
    }  


    //Function to make new coin 

    //1. Minter should be the owner
    //2. New COin should be send and added into the recievers wallet

    function mint (address reciever, uint amount ) payable public{
        require(msg.sender == minter);
        balance[reciever] += amount;  //amount will be the new coins and balance[reciever] shows the reciever account balance

    }

    error insufficientBalance (uint requested, uint available);

    //Function to send from existing coins instead of minting new and sending them

    function send(address reciever, uint amount) payable public {
        
        //Making condition to confirm sending amount is always less than present balance in the account of the sender

        if(amount > balance[msg.sender])
        revert insufficientBalance({
            requested: amount,
            available: balance[msg.sender]
        });

        // sending coins
            balance[msg.sender] -= amount;
            balance[reciever] += amount;

            emit Sent(msg.sender, reciever, amount);
    }


}
