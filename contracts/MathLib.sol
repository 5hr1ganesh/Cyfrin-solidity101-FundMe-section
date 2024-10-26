// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

library MathLib {
    function sum(uint x, uint y) pure  internal returns (uint z){
        z = x+y;
        return z;
    }
}