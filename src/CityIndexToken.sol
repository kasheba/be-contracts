// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CityIndexToken is ERC20 {
    address public owner;

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) ERC20(_name, _symbol) {
        owner = msg.sender;
        _mint(owner, _initialSupply);
    }

    function mint(address _to, uint256 _amount) external {
        require(msg.sender == owner, "Only owner can mint tokens");
        _mint(_to, _amount);
    }

    function burn(uint256 _amount) external {
        _burn(msg.sender, _amount);
    }
}
 // need to track

 /*
 DESCRIPTION

 This contract creates and manages city index tokens.
It includes functions for minting and burning tokens.
 
 
 */