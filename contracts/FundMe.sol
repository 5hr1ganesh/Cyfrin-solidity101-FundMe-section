// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Objectives:
// Get funds from users
// Set a minimum funding value in USD

import{PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint;
    

    uint public minimumUsd = 5e18;

    address[] public funders;
    mapping (address funder => uint amountFunded) public addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");    
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    // What is a revert ?
    // it undoes any action that has been done, and sends the remaining gas back
    }

    // function withdraw() public {}


}