//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.28;

import {Script} from "forge-std/Script.sol";
import {FirstNFTCollection} from "../src/FirstNFTCollection.sol";

contract DeployNFTCollection is Script {

    function run() external returns (FirstNFTCollection) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        string memory name_ = "FirstNFTCollection";
        string memory symbol_ = "FNFT";
        uint256 totalSupply_ = 2;
        string memory baseUri_ = "ipfs://bafybeic2rfn2z3kwmroitfmr4aa4t2sm4mtkdokhxklovqyu2afyu7q4aq/";
        FirstNFTCollection nftCollection = new FirstNFTCollection(name_, symbol_, totalSupply_, baseUri_);
        vm.stopBroadcast();
        return nftCollection;
    }
}