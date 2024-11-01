// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import{PriceConverter} from "./PriceConverter.sol";

// error NotOwner();

contract FundMe {
    using PriceConverter for uint;
    
    uint public constant MIN_USD = 5e18;

    address[] public funders;
    mapping (address funder => uint amountFunded) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MIN_USD, "didn't send enough ETH");    
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyi_owner {
        
        for(uint funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);
        
        (bool callSuccess, ) = payable (msg.sender).call{value: address(this).balance}(""); 
        require(callSuccess, "Call failed");
        
    }

    modifier onlyi_owner() {
        require(msg.sender == i_owner, "Sender is not i_owner");
        // if(msg.sender != i_owner) {revert NotOwner();}
        _;
    }

    receive() external payable { 
        fund();
    }

    fallback() external payable { 
        fund();
    }


}