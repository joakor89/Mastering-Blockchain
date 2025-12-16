var Migrations = artifacts.require("./Migrations.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};

var SimpleStorage = artifacts.require("Addition");

module.exports = function (deployer) {
  deployer.deploy(SimpleStorage);
};

