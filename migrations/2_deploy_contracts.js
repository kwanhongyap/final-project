var Item = artifacts.require("./Item.sol");
var Market = artifacts.require("./Market.sol");

module.exports = function(deployer) {
	deployer.deploy(Market);
	deployer.deploy(Item);
};