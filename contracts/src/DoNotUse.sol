// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract OnChainNoun is ERC721 {
    uint256 currentTokenId = 0;

    constructor() ERC721("Framed Nouns", "Framed Nouns") {}

    function mint(address to) public {
        ++currentTokenId;
        _mint(to, currentTokenId);
    }

    function tokenURI(uint256 tokenId) public pure override returns (string memory) {
        // Every 10th NFT is a Unidentified Flying Frame
        if (tokenId % 10 == 0) {
            return "https://bafkreicnnfxk7xkykyoq4do42ljrxgb5sstixgsyr3al5yd5yzxm4plh4m.ipfs.nftstorage.link/";
        } else {
            // All other NFTs are Framed Glizzies
            return "https://bafkreih5ewuk5uymaf6sl4b5vivyw6z2ihthpoookwjw2werdmkf5hvgsy.ipfs.nftstorage.link/";
        }
    }
}
