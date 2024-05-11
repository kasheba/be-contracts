// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/AnalyticsAPICaller.sol";

contract AnalyticsApiCallerScripts is Script {
    function run() external returns(AnalyticsAPICaller) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        AnalyticsAPICaller apiCaller = deployAnalyticsContract();
        vm.stopBroadcast();
        return apiCaller;
    }

    function deployAnalyticsContract() internal returns (AnalyticsAPICaller) {
        bytes32 _dontID = vm.envBytes32("CHAINLINK_DONT_ID");
        address _router = vm.envAddress("CHAINLINK_ROUTER");

        AnalyticsAPICaller caller = new AnalyticsAPICaller(_dontID, _router);
        return caller;
    }
}
