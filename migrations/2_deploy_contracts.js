const DStorage = artifacts.require("DStorage");

module.exports = function(deployer) {
	//Deploy Contract of DStorage (.sol)
	deployer.deploy(DStorage);
};
