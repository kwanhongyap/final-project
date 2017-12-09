'use strict';
const Market = artifacts.require("./Market.sol");


contract('testMarket', function(accounts) {
	
	const owner1 = accounts[0];
    const owner2 = accounts[1];
    const owner3 = accounts[2];
	let market;

	
	beforeEach(async function() {
		let m = await Market.new({from : owner1});
		market = m;
		let contractowner = await market.creator.call();
		assert.equal(owner1, contractowner, "no contract owner.");
		await market.upLoad(1, 5, {from: owner2});
		let item = await market.lookUp.call(0, {from: owner3});
		assert.equal(item[0].valueOf(), 1, "different id.");
		assert.equal(item[1].valueOf(), 5, "different price.");
		assert.equal(item[2].valueOf(), owner2, "different owner.");
		assert.equal(item[3].valueOf(), true, "different value.");
		await market.request(0, {from: owner3, value: 5});
		let rRequest = await market.rRequestcheck.call(0, {from: owner3});
		let oRequest = await market.oRequestcheck.call(0, {from: owner2});
		assert.equal(rRequest.valueOf(), 1, "different status");
		assert.equal(oRequest.valueOf(), 1, "different status");
		await market.acknowledge(0, 1, {from: owner2});
		let rAck = await market.rackCheck.call(0, {from: owner3});
		let oAck = await market.oackCheck.call(0, {from: owner2});
		assert.equal(rAck.valueOf(), 2, "different status");
		assert.equal(oAck.valueOf(), 2, "different status");
		let rent = await market.transact.call(0, 1, {from: owner3});
		assert.equal(rent.valueOf(), 3, "fail to rent");
	});

	describe('Initialise and Upload', function() {
		it("Initialise + Upload", async function() {
		});
	});
});