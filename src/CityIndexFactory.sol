// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {CityIndex} from "./CityIndex.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CityIndexFactory is Ownable {
    mapping(string => address) cityIndexes;
    address private analyticsApiCaller;

    constructor(address _initialOwner, address _apiCallerAddress) Ownable(_initialOwner) {
        analyticsApiCaller = _apiCallerAddress;
    }

    /**
     * Function to set the analytics API caller
     * @param _newAnalyticsApiCaller address of the new analytics API caller
     */
    function setAnalyticsApiCaller(address _newAnalyticsApiCaller) external onlyOwner {
        analyticsApiCaller = _newAnalyticsApiCaller;
    }

    /**
     * Function to get the Analytics API caller contract address
     */
    function getAnalyticsApiCaller() public view returns (address apiCaller) {
        return analyticsApiCaller;
    }

    /**
     * Function to mint new city indexes
     * @param _name Name of the city, this should be as per Parcl API city names
     * @param _code Parcl API city code, this should be as per Parcl API city codes
     * @param _symbol Symbol of the city
     * @param _squareFeet Total number of sqaure feet in the city
     */
    function mint(string memory _name, string memory _code, string memory _symbol, uint256 _squareFeet)
        external
        onlyOwner
        returns (address)
    {
        CityIndex cityIndex = new CityIndex(owner(), _name, _code, _symbol, _squareFeet, analyticsApiCaller);
        cityIndexes[_symbol] = address(cityIndex);
        return address(cityIndex);
    }

    /**
     * Function to find a city index address
     * @param _symbol Symbol of the city
     */
    function findCityIndex(string memory _symbol) external view returns (address) {
        return cityIndexes[_symbol];
    }
}
