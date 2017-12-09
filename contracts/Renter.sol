pragma solidity ^0.4.15;

//import './Market.sol';

contract Renter {
    mapping(address => uint[]) public items;
    mapping(address => uint[]) public prices;
    mapping(address => uint[]) public rentprices;
    mapping(address => address[]) public owners;
    mapping(address => uint[]) public commitfees;
    mapping(address => uint[]) public rentdurations;
    mapping(address => uint[]) public nows;
    mapping(address => uint[]) public statuss;
    mapping(address => bytes32[]) public rhashings;
    mapping(address => bytes32[]) public ohashings;
    mapping(address => bool[]) public available;

    function Renter() public {
    }
    function request(address renter, uint item, uint price, address owner, uint commitfee) public {
        items[renter].push(item);
        prices[renter].push(price);
        owners[renter].push(owner);
        commitfees[renter].push(commitfee);
        nows[renter].push(now);
        statuss[renter].push(1);
        rhashings[renter].push(0);
        ohashings[renter].push(0);
        available[renter].push(true);
    }

    function indexCheck(address renter, uint index) returns (bool) {
        if (index >= available[renter].length) {
            return false;
        } else {
            if (available[renter][index]) {
                return true;
            }
            return false;
        }
    }

    function itemsCheck(address renter, uint index) returns (uint) {
        return items[renter][index];
    }

    function indexBool(address renter, uint item) returns (bool) {
        uint limit = items[renter].length;
        for (uint i = 0; i < limit; i++) {
            if (items[renter][i] == item) {
                return true;
            }
        }
        return false;
    }


    function indexFinding(address renter, uint item) returns (uint) {
        uint limit = items[renter].length;
        for (uint i = 0; i < limit; i++) {
            if (items[renter][i] == item) {
                return i;
            }
        }
        return 0;
    }

    function pricesCheck(address renter, uint index) returns (uint) {
        return prices[renter][index];
    }

    function rentpricesCheck(address renter, uint index) returns (uint) {
        return rentprices[renter][index];
    }

    function ownersCheck(address renter, uint index) returns (address) {
        return owners[renter][index];
    }

    function commitfeesCheck(address renter, uint index) returns (uint) {
        return commitfees[renter][index];
    }

    

    function rentdurationsCheck(address renter, uint index) returns (uint) {
        return rentdurations[renter][index];
    }

    function nowsCheck(address renter, uint index) returns (uint) {
        return nows[renter][index];
    }

    

    function statussCheck(address renter, uint index) returns (uint) {
        return statuss[renter][index];
    }

    function rhashingsCheck(address renter, uint index) returns (bytes32) {
        return rhashings[renter][index];
    }

    function ohashingsCheck(address renter, uint index) returns (bytes32) {
        return ohashings[renter][index];
    }

    function statussSet(address renter, uint index, uint status) {
        statuss[renter][index] = status;
    }

    function statussSet3(address renter, uint index) {
        statuss[renter][index] = 3;
    }

    function statussSet4(address renter, uint index) {
        statuss[renter][index] = 3;
    }

    function statussSet0(address renter, uint index) {
        statuss[renter][index] = 0;
    }

    function previousSet(address renter, uint index, uint time) {
        nows[renter][index] = time;
    } 

    function availableSet(address renter, uint index, bool val) {
        available[renter][index] = val;
    }

    function acknowledge(address renter, uint index, bytes32 ohash, bytes32 ohash2) {
        nows[renter][index] = now;
        statuss[renter][index] = 2;
        ohashings[renter][index] = ohash;
        rhashings[renter][index] = ohash2;
    }
    
}
