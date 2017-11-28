pragma solidity ^0.4.15;

contract Owner {
    Item item;
    uint public lengthtemp;
    uint public templength;
    mapping(address => Item[]) public  requests;
    mapping(address => Orequest[]) public  requests2;
    mapping(address => Transact[]) public transacts;
    mapping(address => Deposit[]) public deposits;

    struct Transact {
        address renter;
        string name;
        address owner;
        uint price;
        uint rfee;
        uint ofee;
    }

    struct Deposit {
        address renter;
        string name;
        address owner;
        uint price;
        uint rfee;
    }

    struct Item {
		string name;
		address owner;
		uint price;
	}

    struct Orequest {
        address renter;
        string name;
        address owner;
        uint price;
        uint fee;
    }

    function Owner() public {
        templength = 0;
        lengthtemp = 0;
    }

    function requesting2(address renter, string name, address owner, uint price, uint fee) public {
        requests2[owner].push(Orequest(renter, name, owner, price, fee));
        templength = requests[owner].length;
    }

    function requesting(address renter, string name, address owner, uint price) public {
        requests[renter].push(Item(name, owner, price));
        templength = requests[renter].length;
    }

    function namerequest(address renter, uint index) public returns (string) {
        Item retval = requests[renter][index];
        lengthtemp = 1;
        return retval.name;
    }

    function namerequest2(address owner, uint index) public returns (string) {
        Orequest retval = requests2[owner][index];
        lengthtemp = 1;
        return retval.name;
    }

    function addressrequest2(address owner, uint index) public returns (address) {
        Orequest retval = requests2[owner][index];
        lengthtemp = 1;
        return retval.renter;
    }

    function addressrequest(address renter, uint index) public returns (address) {
        Item retval = requests[renter][index];
        lengthtemp = 1;
        return retval.owner;
    }

    function pricerequest(address renter, uint index) public returns (uint) {
        Item retval = requests[renter][index];
        lengthtemp = 1;
        return retval.price;
    }

    function pricerequest2(address owner, uint index) public returns (uint) {
        Orequest retval = requests2[owner][index];
        lengthtemp = 1;
        return retval.price;
    }

    function transacting(address renter, string name, address owner, uint price, uint rfee, uint ofee) public {
        transacts[owner].push(Transact(renter, name, owner, price, rfee, ofee));    
    }

    function pricetransact(address owner, uint index) public returns (uint) {
        Transact retval = transacts[owner][index];
        lengthtemp = 1;
        return retval.price;
    }

    function depositing(address renter, string name, address owner, uint price, uint rfee) public {
        deposits[owner].push(Deposit(renter, name, owner, price, rfee));
    }

    function rentfee(address owner, uint index) public returns (uint) {
        Deposit retval = deposits[owner][index];
        return retval.rfee;
    }


}




	