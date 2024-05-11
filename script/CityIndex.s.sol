// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/AnalyticsAPICaller.sol";
import "../src/CityIndex.sol";
import "../src/CityIndexFactory.sol";

contract CityIndexScripts is Script {
    function run(address factory, string memory _name, string memory _code, string memory _symbol, uint256 _squareFeet)
        external
        returns (address)
    {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        CityIndexFactory cityIndexFactory = CityIndexFactory(factory);
        address cityIndex = cityIndexFactory.mint(_name, _code, _symbol, _squareFeet);
        vm.stopBroadcast();
        return cityIndex;
    }
}
