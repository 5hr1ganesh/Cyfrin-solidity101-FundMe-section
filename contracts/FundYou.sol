// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import{MathLib} from "./MathLib.sol";

contract FundYou{
    using MathLib for uint;

    function calculateSum(uint x, uint y) public pure returns(uint) {
        return MathLib.sum(x,y);
    }
    

}


