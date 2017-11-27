pragma solidity ^0.4.15;

import './Renter.sol';
import './Owner.sol';
import './Transaction.sol';
import './Request.sol';
import './Rentpayment.sol';
import './Rentdeposit.sol';

contract Marketplace {
    address owner;
    Item[] itemlist;
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
        owner = msg.sender;
    }

    function upLoad(bytes32 name, uint price) {
        //owner upload items to marketplace contract
        address owner = msg.sender;
        Item memory uitem = Item(name, owner, price);
        itemlist.push(uitem);
    }

    function lookingUp() returns (Item[] itemlist) {
        //potential renter can lookup what is on the marketplace
        return itemlist;
    }
    
}
