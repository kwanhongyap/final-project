'use strict';


const Renter = artifacts.require("./Renter.sol");


contract('testRenter', function(accounts) {
    const owner1 = accounts[0];
    //print(owner1)
	const owner2 = accounts[1];
	let renter;
	beforeEach(async function() {
        let r = await Renter.new();
        renter = r;
	});

	/* Group test cases together 
	 * Make sure to provide descriptive strings for method arguements and
	 * assert statements
	 */
	describe('Test Renter Opearation', function() {
		it("Renter Operation", async function() {
            let templength = await renter.templength.call();
            assert.equal(templength, 0, "not equal");
            await renter.requesting(owner1,"textbook",  owner2, 6);
            let tempolength = await renter.templength.call();
            assert.equal(tempolength, 1, "not equal");
            let price = await renter.pricerequest.call(owner1, 0);
            //let price = await temprequests[2].valueOf();
            let name = await renter.namerequest.call(owner1, 0);
            let owner = await renter.addressrequest.call(owner1, 0);
            assert.equal(owner, owner2, "not same owner");
            assert.equal(name, "textbook", "different item");
            assert.equal(price, 6, "not equal"); 
            
		});
		// YOUR CODE HERE
	});

	describe('Your string here', function() {
		// YOUR CODE HERE
	});
});