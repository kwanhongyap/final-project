var Renter = artifacts.require("./Renter.sol");
var Owner = artifacts.require("./Owner.sol");
var Transaction = artifacts.require("./Transaction.sol");
var Request = artifacts.require("./Request.sol");
var Rentpayment = artifacts.require("./Rentpayment.sol");
var Rentdeposit = artifacts.require("./Rentdeposit.sol");
var Marketplace = artifacts.require("./Marketplace.sol");

module.exports = function(deployer) {
	deployer.deploy(Renter);
	deployer.deploy(Owner);
	deployer.deploy(Transaction);
	deployer.deploy(Request);
	deployer.deploy(Rentpayment);
	deployer.deploy(Rentdeposit);
	deployer.deploy(Marketplace);
};