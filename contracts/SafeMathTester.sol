// SPDX-License-Identifier: MIT
pragma solidity ^0.6;

import "@openzeppelin/contracts/math/SafeMath.sol";

contract SafeMathTester {
    using SafeMath for uint256;
    uint8 public bigNumber = 255;

    function add(uint8 num) public {
        uint256 newNumber = uint256(bigNumber).add(num); // Use uint256 for SafeMath operations
        require(newNumber <= 255, "Overflow"); // Ensure the result fits into uint8
        bigNumber = uint8(newNumber); // Convert back to uint8
    }
}
