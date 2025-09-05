const { network } = require("hardhat");

const { developmentChains } = require("../helper-hardhat-config");
const { verify } = require("../utils/verify");

module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments;
    const { deployer } = await getNamedAccounts(); // Get the deployer account

    // Deploy the contract
    const args = [];

    const NoNEcom = await deploy("NoNEcom", {
        from: deployer,
        args: args, // Pass the constructor arguments
        log: true, // Enable logging during deployment
    });
    log("_____________________________________________");

    // Verify the contract on Etherscan if it's not a development chain
    if (!developmentChains.includes(network.name) && process.env.ETHERSCAN_API_KEY) {
        await verify(NoNEcom.address, args); // Verify on Etherscan
    }

};

module.exports.tags = ["all", "NoNEcom"];