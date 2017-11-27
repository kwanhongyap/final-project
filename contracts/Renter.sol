pragma solidity ^0.4.15;

contract Renter {
    Item item;
    mapping(address => Item[]) requests;
    struct Item {
		bytes32 name;
		address owner;
		uint price;
	} 

    function Renter() public {
    }

    function requesting(address renter, bytes32 name, address owner, uint price) public {
        requests[renter].push(Item(name, owner, price));
    }
}
