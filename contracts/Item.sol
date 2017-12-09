pragma solidity ^0.4.15;

//import './Market.sol';

contract Item {
    mapping(uint => address) public renters;
    mapping(uint => address) public owners;
    mapping(uint => uint) public prices;
    mapping(uint => uint) public startimes;
    mapping(uint => uint) public statuss;
    mapping(uint => bytes32) public ohashs;
    mapping(uint => bool) public availables;

    function Item() public {
    }

    function upload(uint item, uint price, address owner) {
        renters[item] = 0;
        owners[item] = owner;
        prices[item] = price;
        startimes[item] = 0;
        statuss[item] = 0;
        ohashs[item] = 0;
        availables[item] = true;
    }

    function request(uint item, address renter) {
        renters[item] = renter;
        startimes[item] = now;
        statuss[item] = 1;
        availables[item] = false;
    }

    function acknowledge(uint item, bytes32 ohash) {
        ohashs[item] = ohash;
        statuss[item] = 2;
        startimes[item] = now;
    }

    function oitemCheck(uint item, address owner) returns (bool) {
        if (owners[item] == owner) {
            return true;
        }
        return false;
    }

    function ritemCheck(uint item, address renter) returns (bool) {
        if (renters[item] == renter) {
            return true;
        } else {
            return false;
        }
    }


    function renterCheck(uint item) returns (address) {
        return renters[item];
    }

    function ownerCheck(uint item) returns (address) {
        return owners[item];
    }

    function priceCheck(uint item) returns (uint) {
        return prices[item];
    }

    function startimeCheck(uint item) returns (uint) {
        return startimes[item];
    }

    function statusCheck(uint item) returns (uint) {
        return statuss[item];
    }

    function ohashCheck(uint item) returns (bytes32) {
        return ohashs[item];
    }

    function availableCheck(uint item) returns (bool) {
        return availables[item];
    }

    function availableFalse(uint item) {
        availables[item] = false;
    }

    function availableTrue(uint item) {
        availables[item] = true;
    }

    function status0(uint item) {
        statuss[item] = 0;
    }

    function status3(uint item) {
        statuss[item] = 3;
    }






    
    
}