pragma solidity ^0.4.15;

import './Renter.sol';
import './Owner.sol';
import './Transaction.sol';
import './Request.sol';
import './Rentpayment.sol';
import './Rentdeposit.sol';

contract Marketplace {
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
    
}
