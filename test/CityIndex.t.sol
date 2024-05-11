// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CityIndex.sol";
import "../src/AnalyticsAPICaller.sol";
import "./mocks/MockAnalyticsAPICaller.sol";

contract CityIndexTest is Test {
    CityIndex cityIndex;
    AnalyticsAPICaller public mockApiCaller;
    address owner;
    address user;

    function setUp() public {
        owner = address(this);
        user = vm.addr(0x1);
        mockApiCaller = new MockAnalyticsAPICaller(bytes32("123"), vm.addr(0x2));
        cityIndex = new CityIndex(owner, "New York City", "NY", "NYCI", 100000, address(mockApiCaller));
    }

    function test_TokenDetailsValid() external view {
        assertEq("New York City", cityIndex.name());
        assertEq("NY", cityIndex.code());
        assertEq("NYCI", cityIndex.symbol());
        assertEq(cityIndex.totalSupply(), 100000e18);
        assertEq(cityIndex.balanceOf(owner), 100000e18);
        assertEq(cityIndex.owner(), owner);
    }

    function testSetCode() public {
        cityIndex.setCode("NEWCODE");
        assertEq(cityIndex.code(), "NEWCODE");
    }

    function testPriceFeed() public {
        bytes32 requestId = cityIndex.priceFeed(123);
        assertTrue(requestId != 0);
    }

    function testPauseUnpause() public {
        cityIndex.pause();
        assertTrue(cityIndex.paused());
        cityIndex.unpause();
        assertFalse(cityIndex.paused());
    }

    function testBuySell() public {
        uint256 initialOwnerBalance = cityIndex.balanceOf(owner);
        uint256 initialUserBalance = cityIndex.balanceOf(user);

        cityIndex.buy(user, 100);

        uint256 buyOwnerBalance = cityIndex.balanceOf(owner);
        uint256 buyUserBalance = cityIndex.balanceOf(user);

        assertEq(buyOwnerBalance, initialOwnerBalance - 100e18);
        assertEq(buyUserBalance, initialUserBalance + 100e18);

        cityIndex.sell(user, 100);

        uint256 sellOwnerBalance = cityIndex.balanceOf(owner);
        uint256 sellUserBalance = cityIndex.balanceOf(user);

        assertEq(sellOwnerBalance, buyOwnerBalance + 100e18);
        assertEq(sellUserBalance, buyUserBalance - 100e18);
    }
}
