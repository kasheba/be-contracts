// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/AnalyticsAPICaller.sol";
import "../src/CityIndex.sol";
import "../src/CityIndexFactory.sol";

contract CityIndexFactoryScripts is Script {
    function run(address apiCaller) external returns(address factory) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address indexFactory = deployCityIndexFactory(apiCaller);
        vm.stopBroadcast();
        return indexFactory;
    }

    function deployCityIndexFactory(address apiCaller) internal returns (address cityIndexFactory) {
        CityIndexFactory factory = new CityIndexFactory(msg.sender, apiCaller);
        return address(factory);
    }
}
