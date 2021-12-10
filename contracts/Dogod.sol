// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Dogods is ERC721 {
    using Strings for uint256;
    string public domain = "https://miniswap.herokuapp.com/charactor/detail/";

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {}

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(_exists(tokenId), "Token Id is not available");
        if (bytes(domain).length > 0) {
            return string(abi.encodePacked(domain, tokenId.toString()));
        } else {
            return "";
        }
    }

    function createDogod(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }
}
