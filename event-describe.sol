pragma solidity >=0.7.0 <0.9.0;

//events are like one way transmission once its fired only the person on the frontend can see them and it'll not
//store in solidity. So, you can't find them in code its just a reaction of the event fired from frontend
// and depends on described in solidity

contract EventHelp{

    //includes 2 things
    // 1. Declating the events
    // 2. Emitting the events

    event NewTrade(
        
        // indexed keyword use to filterate through the whole data to get what consumer called for
        //It consume a bit higher gas(ethereum) so only allowed 3 times in an event
        uint indexed date,
        address from, 
        address indexed to, 
        uint indexed amount);


    function trade(address to, uint amount) external {
        //Outside consumer will see the emit event through web3js
        // block.timestamp is a global variable in solidity to get current timestamp
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }
}
