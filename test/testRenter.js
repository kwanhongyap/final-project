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
            //await renter.requesting(owner1,"textbook",  owner2, 6);
            //let templength = await renter.requests[owner1].length;
            //assert.equal(templength, 1, "not equal")
            
		});
		// YOUR CODE HERE
	});

	describe('Your string here', function() {
		// YOUR CODE HERE
	});
});