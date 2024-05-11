// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RealEstateMetrics {
    struct CityMetrics {
        uint256 medianGrowth;
        uint256 medianValue;
        uint256 medianRent;
        uint256 rentalYields;
        uint256 ageOfOccupants;
        mapping(string => uint256) demographics;
        mapping(string => uint256) amenities;
    }

    mapping(string => CityMetrics) public cityData;

    event CityMetricsUpdated(string cityName, uint256 medianGrowth, uint256 medianValue, uint256 medianRent, uint256 rentalYields, uint256 ageOfOccupants);

    function updateCityMetrics(
        string memory cityName,
        uint256 _medianGrowth,
        uint256 _medianValue,
        uint256 _medianRent,
        uint256 _rentalYields,
        uint256 _ageOfOccupants,
        string[] memory _demographics,
        uint256[] memory _demographicsValues,
        string[] memory _amenities,
        uint256[] memory _amenitiesValues
    ) external {
        CityMetrics storage city = cityData[cityName];
        city.medianGrowth = _medianGrowth;
        city.medianValue = _medianValue;
        city.medianRent = _medianRent;
        city.rentalYields = _rentalYields;
        city.ageOfOccupants = _ageOfOccupants;

        for (uint256 i = 0; i < _demographics.length; i++) {
            city.demographics[_demographics[i]] = _demographicsValues[i];
        }

        for (uint256 i = 0; i < _amenities.length; i++) {
            city.amenities[_amenities[i]] = _amenitiesValues[i];
        }

        emit CityMetricsUpdated(cityName, _medianGrowth, _medianValue, _medianRent, _rentalYields, _ageOfOccupants);
    }
}

/* DESCRIPTION


The contract stores metrics for each city, including median growth, value, rent, rental yields, and age of occupants.
It also includes demographics and amenities data.
The updateCityMetrics function allows updating or adding metrics for a city.



  */