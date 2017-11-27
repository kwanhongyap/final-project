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
		bytes32 name;
		address owner;
		uint price;
	}

    function Marketplace() {
        //initial constructor
        
        rentstruct = new Renter();
        owner = msg.sender;
        templength = 0;
    }

    function upLoad(bytes32 name, uint price) {
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

    

    function lookingUp() returns (bytes32, address, uint) {
        //potential renter can lookup what is on the 
        address potentialrenter = msg.sender;
        Item retval = itemlist[0];
        return (retval.name, retval.owner, retval.price);

    }

    function request(bytes32 name, address owner, uint price) {
        address renter = msg.sender;
        rentstruct.requesting(renter, name, owner, price);

    } 
    
}
