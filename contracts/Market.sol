pragma solidity ^0.4.15;

import './Item.sol';

contract Market {
    address public creator;
    uint[] public items;
    uint public itemcount;
    Item public itemstruct;

    function Market() {
        creator = msg.sender;
        itemstruct = new Item();
        itemcount = 0;
    }

    function upLoad(uint item, uint price) public {
        address itemowner = msg.sender;
        items.push(item);
        itemstruct.upload(itemcount, price, itemowner);
        itemcount += 1;
    }

    function lookUp(uint index) public returns (uint, uint, address, bool) {
        if (index >= itemcount) {
            return (0,0,0,false);
        }
        if (!itemstruct.availableCheck(index)) {
            return (0,0,0, false);
        }
        uint item = items[index];
        uint price = itemstruct.priceCheck(index);
        address owner = itemstruct.ownerCheck(index);
        bool val = itemstruct.availableCheck(index);
        return (item, price, owner, val);
    }

    function request(uint index) public payable {
        address renter = msg.sender;
        uint commitfee = msg.value;
        if (index >= itemcount) {
            msg.sender.transfer(commitfee);
            // need to print error;
            return;
        }
        uint price = itemstruct.priceCheck(index);
        address owner = itemstruct.ownerCheck(index);
        bool val = itemstruct.availableCheck(index);
        if (!val || commitfee < price) {
            msg.sender.transfer(commitfee);
            // need to print error;
            return;
        }
        itemstruct.request(index, renter);   
    }

    function rRequestcheck(uint index) returns (uint) {
        address renter = msg.sender;
        if (!itemstruct.ritemCheck(index, renter) || itemstruct.availableCheck(index) || itemstruct.statusCheck(index) != 1) {
            return 0;
        }
        uint start = itemstruct.startimeCheck(index);
        // 10 is the waiting time
        if (now > start + 10) {
            itemstruct.status0(index);
            itemstruct.availableTrue(index);
            uint price = itemstruct.priceCheck(index);
            renter.transfer(price);
        }
        uint status = itemstruct.statusCheck(index);
        return status;
    }

    function oRequestcheck(uint index) returns (uint) {
        address owner = msg.sender;
        if (!itemstruct.oitemCheck(index, owner) || itemstruct.availableCheck(index) || itemstruct.statusCheck(index) != 1) {
            return 0;
        }
        uint start = itemstruct.startimeCheck(index);
        // 10 is the waiting time
        if (now > start + 10) {
            itemstruct.status0(index);
            itemstruct.availableTrue(index);
            address renter = itemstruct.renterCheck(index);
            uint price = itemstruct.priceCheck(index);
            renter.transfer(price);
        }
        uint status = itemstruct.statusCheck(index);
        return status;
    }

    function acknowledge(uint index, uint key) {
        address owner = msg.sender;
        if (!itemstruct.oitemCheck(index, owner) || itemstruct.availableCheck(index) || itemstruct.statusCheck(index) != 1) {
            return;
        }
        uint start = itemstruct.startimeCheck(index);
        if (now > start + 10) {
            itemstruct.status0(index);
            itemstruct.availableTrue(index);
            address renter = itemstruct.renterCheck(index);
            uint price = itemstruct.priceCheck(index);
            renter.transfer(price);
            return;
        }
        itemstruct.acknowledge(index, sha3(key));   
    }

    function oackCheck(uint index) returns (uint) {
        address owner = msg.sender;
        if (!itemstruct.oitemCheck(index, owner) || itemstruct.availableCheck(index) || itemstruct.statusCheck(index) != 2) {
            return 0;
        }
        uint start = itemstruct.startimeCheck(index);
        // 10 is the waiting time
        if (now > start + 10) {
            itemstruct.status0(index);
            itemstruct.availableTrue(index);
            address renter = itemstruct.renterCheck(index);
            uint price = itemstruct.priceCheck(index);
            renter.transfer(price);
        }
        uint status = itemstruct.statusCheck(index);
        return status;
    }

    function rackCheck(uint index) returns (uint) {
        address renter = msg.sender;
        if (!itemstruct.ritemCheck(index, renter) || itemstruct.availableCheck(index) || itemstruct.statusCheck(index) != 2) {
            return 0;
        }
        uint start = itemstruct.startimeCheck(index);
        // 10 is the waiting time
        if (now > start + 10) {
            itemstruct.status0(index);
            itemstruct.availableTrue(index);
            uint price = itemstruct.priceCheck(index);
            renter.transfer(price);
        }
        uint status = itemstruct.statusCheck(index);
        return status;
    }

    function transact(uint index, uint key) returns (uint) {
        address renter = msg.sender;
        if (!itemstruct.ritemCheck(index, renter) || itemstruct.availableCheck(index) || itemstruct.statusCheck(index) != 2) {
            return 0;
        }
        uint start = itemstruct.startimeCheck(index);
        uint price = itemstruct.priceCheck(index);
        // 10 is the waiting time
        if (now > start + 10) {
            itemstruct.status0(index);
            itemstruct.availableTrue(index);
            renter.transfer(price);
            return 0;
        }
        bytes32 ohash = itemstruct.ohashCheck(index);
        if (ohash == sha3(key)) {
            address owner = itemstruct.ownerCheck(index);
            itemstruct.status3(index);
            owner.transfer(price);
            
            return 3;
        }
        return 2;
    }
    
}