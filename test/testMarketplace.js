'use strict';

const Marketplace = artifacts.require("./Marketplace.sol");


contract('TestMarketplace', function(accounts) {
	
    const owner1 = accounts[0];
    //print(owner1)
	const owner2 = accounts[1];
	let marketplace;
	
	beforeEach(async function() {
		let mp = await Marketplace.new({from : owner1});
		marketplace = mp;
	});

	
	describe('Initialization and Upload', function() {
		it("Init+Upload", async function() {
			let contractowner = await marketplace.owner.call();
            assert.equal(owner1, contractowner, "no contract owner.")
            let itemlength = await marketplace.itemlist.length.call();
            assert.equal(itemlength, 0, "wrong no of items")
            await marketplace.upLoad("iclicker", 5, {from: owner2})
		});
		// YOUR CODE HERE
	});

	describe('Your string here', function() {
		// YOUR CODE HERE
	});
});