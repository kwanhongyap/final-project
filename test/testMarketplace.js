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
            let tempo = await marketplace.templength.call();
            assert.equal(owner1, contractowner, "no contract owner.")
            
            assert.equal(tempo, 0, "not equal")
            await marketplace.upLoad("iclicker", 5, {from: owner2});
            let items = await marketplace.templength.call();
            assert.equal(items.valueOf(), 1, "wrong no of items");
            await marketplace.upLoad("iclicker2", 5, {from: owner2});
            let items2 = await marketplace.templength.call();
            assert.equal(items2.valueOf(), 2, "wrong no of items");
            let itemlisting = await marketplace.lookingUp.call({from: owner2});
            assert.equal(itemlisting.valueOf()[2], 5, "wrong item");
        });
		// YOUR CODE HERE
	});

	describe('Look up Item', function() {
        // YOUR CODE HERE
        it("Init+Upload", async function() {
            //let itemlisting = await marketplace.lookingUp.call();
            //assert.equal(itemlisting.valueOf(), 5, "wrong item");
        });
        
	});
});