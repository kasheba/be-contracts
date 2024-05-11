// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "../../src/AnalyticsAPICaller.sol";

contract MockAnalyticsAPICaller is AnalyticsAPICaller {
    constructor(bytes32 _donID, address _router) AnalyticsAPICaller(_donID, _router) {}

    function sendRequest(uint64 _subscriptionId, string[] memory _args) external override returns (bytes32) {
        return bytes32("123"); // Mocked request ID
    }
}
