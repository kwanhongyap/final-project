pragma solidity ^0.4.15;

import './Renter.sol';
import './Owner.sol';
import './Transaction.sol';
import './Request.sol';
import './Rentpayment.sol';
import './Rentdeposit.sol';

contract Marketplace {
    address public owner;
    uint public templength;
    Item public tempitem;
    Item[] public tempitemlist;
    Item[] public itemlist;
	Renter public rentstruct;
	Owner ownstruct;
	Transaction tstruct;
	Request rstruct;
	Rentpayment rpstruct;
	Rentdeposit rdstruct;

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

    function Marketplace() {
        //initial constructor
        
        rentstruct = new Renter();
        ownstruct = new Owner();
        owner = msg.sender;
        templength = 0;
    }

    function owner() public returns (address) {
        return owner;
    }

    function templength() public returns (uint) {
        return templength;
    }

    function upLoad(string name, uint price) {
        //owner upload items to marketplace contract
        address itemowner = msg.sender;
        for (uint index = 0; index < tempitemlist.length; index++) {
            itemlist[index] = tempitemlist[index];
        }

        itemlist.push(Item(name, itemowner, price));
        Item[] memory tempitemlist = new Item[](itemlist.length);
        for (uint i = 0; i < itemlist.length; i++) {
            tempitemlist[i] = itemlist[i];
        }
        //Item[] memory tempitemlist = itemlist;
        templength = itemlist.length;    
    }

    

    function lookingUp() returns (string, address, uint) {
        //potential renter can lookup what is on the 
        address potentialrenter = msg.sender;
        Item retval = itemlist[0];
        return (retval.name, retval.owner, retval.price);

    }

    function request(string name, address owner, uint price) {
        address renter = msg.sender;
        rentstruct.requesting(renter, name, owner, price);

    }

    function request2(string name, address renter, uint price, uint fee) {
        address owner = msg.sender;
        ownstruct.requesting2(renter, name, owner, price, fee);

    }

    function request3(string name, address owner, uint price, uint fee) {
        address renter = msg.sender;
        rentstruct.requesting2(renter, name, owner, price, fee);

    }
    
    function requestcheck(uint index) public returns ( address, uint) {
        address renter = msg.sender;
        //string tname = rentstruct.namerequest(renter, index);
        address towner = rentstruct.addressrequest(renter, index);
        uint tprice = rentstruct.pricerequest(renter, index);
        return ( towner, tprice);
    }

    function requestcheck2(uint index) public returns ( address, uint) {
        address owner = msg.sender;
        //string tname = rentstruct.namerequest(renter, index);
        address towner = ownstruct.addressrequest2(owner, index);
        uint tprice = ownstruct.pricerequest2(owner, index);
        return ( towner, tprice);
    }

    function requestcheck3(uint index) public returns ( address, uint) {
        address renter = msg.sender;
        //string tname = rentstruct.namerequest(renter, index);
        address towner = rentstruct.addressrequest2(renter, index);
        uint tprice = rentstruct.pricerequest2(renter, index);
        return ( towner, tprice);
    }

    function transact(string name, address renter, uint price, uint rfee, uint ofee, address owner) {
        address towner = msg.sender;
        rentstruct.transacting(renter, name, owner, price, rfee, ofee);
        ownstruct.transacting(renter, name, owner, price, rfee, ofee);
    }

    function transactprice(uint index) public returns (uint) {
        address renter = msg.sender;
        //string tname = rentstruct.namerequest(renter, index);
        //address towner = rentstruct.pricetransact(renter, index);
        uint tprice = rentstruct.pricetransact(renter, index);
        return tprice;
    }

    function transactprice2(uint index) public returns (uint) {
        address owner = msg.sender;
        //string tname = rentstruct.namerequest(renter, index);
        //address towner = rentstruct.pricetransact(renter, index);
        uint tprice = ownstruct.pricetransact(owner, index);
        return tprice;
    }

   function depositrent(address renter, string name, address owner, uint price, uint rfee) public {
        address drenter = msg.sender;
        rentstruct.depositing(renter, name, owner, price, rfee);
        //ownstruct.depositing(renter, name, owner, price, rfee);
        return;
    }

 /*   function depositrent2(address renter, string name, address owner, uint price, uint rfee) public {
        address drenter = msg.sender;
        //rentstruct.rRentdeposit(renter, name, owner, price, rfee);
        ownstruct.oRentdeposit(renter, name, owner, price, rfee);
        return;
    }*/

/*    function rentfee(uint index) public returns (uint) {
        address renter = msg.sender;
        uint rfee = rentstruct.rentfee(renter, index);
        return rfee;
    }*/
/*
    function rentfee2(uint index) public returns (uint) {
        address owner = msg.sender;
        uint rfee = ownstruct.rentfee(owner, index);
        return rfee;
    }*/

}
