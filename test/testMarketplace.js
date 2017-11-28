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
            
            await marketplace.request("iclicker", owner2, 5, {from: owner1});
            let attribute = await marketplace.requestcheck.call(0, {from: owner1});
            assert.equal(attribute.valueOf()[1], 5, "wrong item");

            await marketplace.request2("iclicker", owner1, 5, 5, {from: owner2});
            let attribute2 = await marketplace.requestcheck2.call(0, {from: owner2});
            assert.equal(attribute2.valueOf()[1], 5, "wrong item");

            await marketplace.request3("iclicker", owner2, 5, 5,{from: owner1});
            let attribute3 = await marketplace.requestcheck3.call(0, {from: owner1});
            assert.equal(attribute3.valueOf()[1], 5, "wrong item");

            await marketplace.transact("iclicker", owner1, 5, 5, 5, owner2, {from:owner2});
            let attribute4 = await marketplace.transactprice.call(0, {from: owner1});
            assert.equal(attribute4.valueOf(), 5, "wrong item");

            let attribute5 = await marketplace.transactprice2.call(0, {from: owner2});
            assert.equal(attribute5.valueOf(), 5, "wrong item");

            await marketplace.depositrent.call(owner2, "iclicker", owner1, 5, 5, {from: owner2});
            //await marketplace.depositrent2.call(owner2, "iclicker", owner1, 5, 5, {from: owner2});
            //let attribute6 = await marketplace.rentfee.call(0, {from: owner2});
            //assert.equal(attribute6.valueOf(), 5, "wrong item");

            //let attribute7 = await marketplace.rentfee2.call(0, {from: owner1});
            //assert.equal(attribute7.valueOf(), 5, "wrong item");
        });
		// YOUR CODE HERE
	});
});