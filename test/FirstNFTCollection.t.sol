// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/FirstNFTCollection.sol";

contract FirstNFTCollectionTest is Test {
    FirstNFTCollection nft;
    address internal deployer;
    address internal user1;
    function setUp() public {
        deployer = vm.addr(1);
        user1 = vm.addr(2);
        
        // Deploy the contract with initial values
        nft = new FirstNFTCollection("MyNFT", "MNFT", 10, "ipfs://baseuri/");
    }

    function testConstructorSetsInitialStateCorrectly() public view {
        assertEq(nft.name(), "MyNFT");
        assertEq(nft.symbol(), "MNFT");
        assertEq(nft.totalSupply(), 10);
        assertEq(nft.currentTokenId(), 0);
        assertEq(nft.baseUri(), "ipfs://baseuri/");
    }

    function testMintExceedsTotalSupply() public {
        for (uint256 i = 0; i < 10; i++) {
            vm.prank(user1);
            nft.mint();
        }
        vm.expectRevert("Sold out");
        vm.prank(user1);
        nft.mint();
    }

    function testMintsCorrectly() public {
        vm.startPrank(user1);
        nft.mint();
        vm.stopPrank();

        // Check that the NFT was minted correctly
        assertEq(nft.balanceOf(user1), 1);
        assertEq(nft.ownerOf(0), user1);
        assertEq(nft.currentTokenId(), 1);
    }

    function testMintEmitsEvent() public {
        vm.startPrank(user1);
        vm.expectEmit(true, false, false, true);
        emit FirstNFTCollection.MintNFT(user1, nft.currentTokenId());
        nft.mint();
        vm.stopPrank();
    }

    function testTokenURIRevertsIfTokenNotMinted() public {
        vm.expectRevert(abi.encodeWithSignature("ERC721NonexistentToken(uint256)", 0));
        nft.tokenURI(0);
    }


    function testTokenURIReturnsExpectedURI() public {
        vm.prank(user1);
        nft.mint(); // tokenId 0
        string memory expected = "ipfs://baseuri/0.json";
        assertEq(nft.tokenURI(0), expected);
    }

}
