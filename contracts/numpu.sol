
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract NumberPusher {
    uint[] public numbers;

    function pushNumbers() public returns (uint[] memory) {
        for (uint i = 1; i <= 10; i++) {
            numbers.push(i);
        }
        return numbers;
    }

    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    function expensiveReset() public { 
        for (uint i = 0; i < numbers.length; i++) 
        { numbers[i] = 0; // Reset each element to 0 
        }
    }
}