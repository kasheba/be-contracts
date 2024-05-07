// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../src/APICaller.sol";
import "./mocks/LinkToken.sol";
import "forge-std/Test.sol";
import "./mocks/MockOracle.sol";

contract APICallerTest is Test {
    APICaller public apiCaller;
    LinkToken public linkToken;
    MockOracle public mockOracle;

    bytes32 jobId;
    uint256 fee;
    bytes32 blank_bytes32;

    uint256 constant AMOUNT = 1 * 10 ** 18;
    uint256 constant RESPONSE = 777;

    function setUp() public {
        linkToken = new LinkToken();
        mockOracle = new MockOracle(address(linkToken));
        apiCaller = new APICaller(address(mockOracle), jobId, fee, address(linkToken));
        linkToken.transfer(address(apiCaller), AMOUNT);
    }

    function testCanMakeRequest() public {
        bytes32 requestId = apiCaller.requestData("https://localhost:8080/api");
        assertTrue(requestId != blank_bytes32);
    }

    function testCanGetResponse() public {
        bytes32 requestId = apiCaller.requestData("https://localhost:8080/api");
        mockOracle.fulfillOracleRequest(requestId, bytes32(RESPONSE));
        assertTrue(apiCaller.volume() == RESPONSE);
    }
}
