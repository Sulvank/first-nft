// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/Script.sol";
import "../script/DeployNFTColecction.s.sol";
import "../src/FirstNFTCollection.sol";

contract DeployNFTScriptTest is Test {
    DeployNFTCollection internal deployScript;

    function testDeploysWithoutError() public {
        deployScript = new DeployNFTCollection();
        deployScript.run();
    }

}
