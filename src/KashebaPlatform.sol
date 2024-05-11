// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CityIndexToken.sol";
import "./AnalyticsContract.sol";
import "./ChainlinkOracle.sol";

contract KashebaPlatform {
    address public owner;
    CityIndexToken public cityIndexToken;
    AnalyticsContract public analyticsContract;
    ChainlinkOracle public chainlinkOracle;

    constructor(
        string memory _tokenName,
        string memory _tokenSymbol,
        uint256 _initialSupply,
        address _analyticsContract,
        address _chainlinkOracle
    ) {
        owner = msg.sender;
        cityIndexToken = new CityIndexToken(_tokenName, _tokenSymbol, _initialSupply);
        analyticsContract = AnalyticsContract(_analyticsContract);
        chainlinkOracle = ChainlinkOracle(_chainlinkOracle);
    }

    function tradeCityIndexTokens(uint256 _amount) external {
        require(cityIndexToken.balanceOf(msg.sender) >= _amount, "Insufficient balance");
        // Trade logic here
    }

    function getCityMetrics(string memory _cityName) external view returns (uint256 medianGrowth, uint256 medianValue, uint256 medianRent, uint256 rentalYields, uint256 ageOfOccupants) {
        return analyticsContract.getCityMetrics(_cityName);
    }

    function getLatestPrice() external view returns (int256) {
        return chainlinkOracle.getLatestPrice();
    }
}


/*
DESCRIPTION

This contract integrates all other contracts.
It handles trading of city index tokens.
It provides functions to fetch city metrics and latest price data.


*/