pragma solidity ^0.4.15;

import './Renter.sol';
import './Owner.sol';
import './Transaction.sol';
import './Request.sol';
import './Rentpayment.sol';
import './Rentdeposit.sol';

contract Marketplace {
    address public owner;
    uint[] public owner2;
    uint public templength;
    Item public tempitem;
    Item[] public itemlist;
	Renter rentstruct;
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
        
        owner2[owner2.length++] = 1;
        owner = msg.sender;
        templength = owner2.length;
    }

    function upLoad(bytes32 name, uint price) {
        //owner upload items to marketplace contract
        address itemowner = msg.sender;
        itemlist.push(Item(name, itemowner, price));
        templength = itemlist.length;    
    }

    

    function lookingUp() returns (uint[]) {
        //potential renter can lookup what is on the marketplace
        return owner2;
    }
    
}
