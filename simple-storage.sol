// My first Solidity File

//All the smart contract code will go here

//The first line in smart contract known as Pragma which is basically use to describe the solidity version we are using


pragma solidity >=0.7.0 <0.9.0;


//First Contract will be:  Recieve the data, Store it and Return it back

// A contract is basically a collection of code (functions) and data (its states) that placed at a specific address at respective blockchcain (90% ethereum blockchain)


//First thing while writing a smart contract is give it a name and initialize it with type contract

contract simpleStorage {
    // Now all of the code (functions) and data (its states) will go here inside this contract

    //Now declaring First Variable

    //uint stands for integer value and this variable will always return integer value  
    // uint storeData = 235  
    // string names = 'Tom'
    // bool switchOn = true

    uint storeData;

    // Making Functions (Set of reusable code to perform some action)

    //function to set and get variable values

    //public keyword use to allow other contracts (outside of this contract) to access this function

    function set(uint x) public {
        storeData = x;
    }

    //view is a global modifier represent that there'll be no change of state by this function (read only in short)

    //returns(uint) describes that this function will definitely  return an integer value

    function get() public view returns(uint) {
        return storeData;
    }

}

// second smart Contract

// Same as simpleStorage just multiply the returned value with 5 in get function

contract simpleStorageMultiply {

    uint storeDataM;

    function sets(uint x) public {
        storeDataM = x;
    }

    function gets() public view returns(uint) {
        return storeDataM * 5;
    }

}

// Third smart Contract

// Instead of numbers this should rerturn names

contract nameStorage {

    string nameData;

    //For string value we have to add memory keyword

    function setName(string memory x) public {
        nameData = x;
    }

    function getName() public view returns(string memory) {
        return nameData;
    }

}