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
        //temp = 0;
        owner = msg.sender;
        //Item[] memory itemlist = new Item[](1);
    }

    function upLoad(bytes32 name, uint price) {
        //owner upload items to marketplace contract
        address owner = msg.sender;
        //temp = itemlist.length;
        Item memory uitem = Item(name, owner, price);
        itemlist.push(uitem);
    }

    function lookingUp() returns (Item[] itemlist) {
        //potential renter can lookup what is on the marketplace
        return itemlist;
    }
    
}
