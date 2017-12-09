pragma solidity ^0.4.15;

//import './Market.sol';

contract Owner {
    mapping(address => uint[]) public items;
    mapping(address => uint[]) public prices;
    mapping(address => uint[]) public rentprices;
    mapping(address => address[]) public renters;
    mapping(address => uint[]) public commitfees;
    mapping(address => uint[]) public rentdurations;
    mapping(address => uint[]) public nows;
    mapping(address => uint[]) public statuss;
    mapping(address => bytes32[]) public rhashings;
    mapping(address => bytes32[]) public ohashings;
    mapping(address => bool[]) public available;
    
    function Owner() public {
    }

    function request(address renter, uint item, uint price, address owner) {
        items[owner].push(item);
        prices[owner].push(price);
        renters[owner].push(renter);
        nows[owner].push(now);
        statuss[owner].push(1);
        rhashings[owner].push(0);
        ohashings[owner].push(0);
        available[owner].push(true);
    }

    function indexCheck(address owner, uint index) returns (bool) {
        if (index >= items[owner].length) {
            return false;
        } else {
            if (available[owner][index]) {
                return true;
            }
            return false;
        }
    }

    function indexBool(address owner, uint item) returns (bool, uint) {
        uint limit = items[owner].length;
        for (uint i = 0; i < limit; i++) {
            if (items[owner][i] == item) {
                return (true, i);
            }
        }
        return (false,0);
    }

    function itemsCheck(address owner, uint index) returns (uint) {
        return items[owner][index];
    }

    function pricesCheck(address owner, uint index) returns (uint) {
        return prices[owner][index];
    }

    function rentpricesCheck(address owner, uint index) returns (uint) {
        return rentprices[owner][index];
    }

    function rentersCheck(address owner, uint index) returns (address) {
        return renters[owner][index];
    }

    function commitfeesCheck(address owner, uint index) returns (uint) {
        return commitfees[owner][index];
    }


    function rentdurationsCheck(address owner, uint index) returns (uint) {
        return rentdurations[owner][index];
    }

    function nowsCheck(address owner, uint index) returns (uint) {
        return nows[owner][index];
    }

    function statussCheck(address owner, uint index) returns (uint) {
        return statuss[owner][index];
    }

    function rhashingsCheck(address owner, uint index) returns (bytes32) {
        return rhashings[owner][index];
    }

    function ohashingsCheck(address owner, uint index) returns (bytes32) {
        return ohashings[owner][index];
    }

    function statussSet(address owner, uint index, uint status) {
        statuss[owner][index] = status;
    }

    function statussSet3(address owner, uint index) {
        statuss[owner][index] = 3;
    }

    function statussSet0(address owner, uint index) {
        statuss[owner][index] = 0;
    }

    function previousSet(address owner, uint index, uint time) {
        nows[owner][index] = time;
    }

    function availableSet(address owner, uint index, bool val) {
        available[owner][index] = val;
    }

    function acknowledge(address owner, uint index, bytes32 ohash, bytes32 ohash2) {
        nows[owner][index] = now;
        statuss[owner][index] = 2;
        ohashings[owner][index] = ohash;
        rhashings[owner][index] = ohash2;
    }
    
}
