// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RealEstateMetrics.sol";

contract AnalyticsContract {
    address public owner;
    RealEstateMetrics public realEstateMetrics;

    constructor(address _realEstateMetrics) {
        owner = msg.sender;
        realEstateMetrics = RealEstateMetrics(_realEstateMetrics);
    }

    function getCityMetrics(string memory cityName) external view returns (uint256 medianGrowth, uint256 medianValue, uint256 medianRent, uint256 rentalYields, uint256 ageOfOccupants) {
        RealEstateMetrics.CityMetrics memory cityMetrics = realEstateMetrics.cityData(cityName);
        return (cityMetrics.medianGrowth, cityMetrics.medianValue, cityMetrics.medianRent, cityMetrics.rentalYields, cityMetrics.ageOfOccupants);
    }
}


/*  DESCRIPTION

The contract fetches city metrics from RealEstateMetrics.
The getCityMetrics function retrieves metrics for a specified city.

*/
