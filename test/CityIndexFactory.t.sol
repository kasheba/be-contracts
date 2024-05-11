// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CityIndexFactory.sol";
import "../src/CityIndex.sol";
import "../src/AnalyticsAPICaller.sol";
import "./mocks/MockAnalyticsAPICaller.sol";

contract CityIndexFactoryTest is Test {
    CityIndexFactory factory;
    AnalyticsAPICaller public mockApiCaller;
    address owner;
    address user;

    function setUp() public {
        owner = address(this);
        user = vm.addr(0x1);
        mockApiCaller = new MockAnalyticsAPICaller(
            bytes32("32"),
            vm.addr(0x2)
        );
        factory = new CityIndexFactory(owner, address(mockApiCaller));
    }

    function test_GetAnalyticsAPICaller() external view {
        assertEq(factory.getAnalyticsApiCaller(), address(mockApiCaller));
    }

    function test_mintCityIndex() external {
        address cityIndexAddr = factory.mint("New York City", "NY", "NYCI", 100000);
        CityIndex cityIndex = CityIndex(cityIndexAddr);
        assertEq(cityIndex.code(), "NY");
        assertEq(cityIndexAddr, factory.findCityIndex("NYCI"));
    }

    function test_findCityIndex() external {
        address cityIndexAddr = factory.mint("New York City", "NY", "NYCI", 100000);
        assertEq(cityIndexAddr, factory.findCityIndex("NYCI"));
    }
}
