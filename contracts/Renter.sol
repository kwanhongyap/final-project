pragma solidity ^0.4.15;

contract Renter {
    Item item;
    uint public lengthtemp;
    uint public templength;
    mapping(address => Item[]) public  requests;
    mapping(address => Rrequest[]) public  requests2;
    mapping(address => Transact[]) public transacts;
    mapping(address => Deposit[]) public deposits;

    struct Deposit {
        address renter;
        string name;
        address owner;
        uint price;
        uint rfee;
    }

    struct Transact {
        address renter;
        string name;
        address owner;
        uint price;
        uint rfee;
        uint ofee;
    }

    struct Item {
		string name;
		address owner;
		uint price;
	}

    struct Rrequest {
        string name;
        address owner;
        uint price;
        uint fee;
    }

    function Renter() public {
        templength = 0;
        lengthtemp = 0;
    }

    function requesting(address renter, string name, address owner, uint price) public {
        requests[renter].push(Item(name, owner, price));
        templength = requests[renter].length;
    }

    function requesting2(address renter, string name, address owner, uint price, uint fee) public {
        requests2[renter].push(Rrequest(name, owner, price, fee));
        //templength = requests2[renter].length;
    }

    function namerequest(address renter, uint index) public returns (string) {
        Item retval = requests[renter][index];
        lengthtemp = 1;
        return retval.name;
    }

    function namerequest2(address renter, uint index) public returns (string) {
        Rrequest retval = requests2[renter][index];
        lengthtemp = 1;
        return retval.name;
    }

    function addressrequest(address renter, uint index) public returns (address) {
        Item retval = requests[renter][index];
        lengthtemp = 1;
        return retval.owner;
    }

    function addressrequest2(address renter, uint index) public returns (address) {
        Rrequest retval = requests2[renter][index];
        lengthtemp = 1;
        return retval.owner;
    }

    function pricerequest(address renter, uint index) public returns (uint) {
        Item retval = requests[renter][index];
        lengthtemp = 1;
        return retval.price;
    }

    function pricerequest2(address renter, uint index) public returns (uint) {
        Rrequest retval = requests2[renter][index];
        lengthtemp = 1;
        return retval.price;
    }

    function transacting(address renter, string name, address owner, uint price, uint rfee, uint ofee) public {
        transacts[renter].push(Transact(renter, name, owner, price, rfee, ofee));    
    }

    function pricetransact(address renter, uint index) public returns (uint) {
        Transact retval = transacts[renter][index];
        lengthtemp = 1;
        return retval.price;
    }

    function depositing(address renter, string name, address owner, uint price, uint rfee) public {
        deposits[renter].push(Deposit(renter, name, owner, price, rfee));
    }

    function rentfee(address renter, uint index) public returns (uint) {
        Deposit retval = deposits[renter][index];
        return retval.rfee;
    }
}
