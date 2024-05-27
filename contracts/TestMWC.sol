// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract TestMWC {
    function testTransfer(
        address payable to
    ) external payable {
        require(msg.value > 0, "fee required");

        (bool success, ) = to.call{value: msg.value}("");
        require(success, "fee failed.");
    }
}
