// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract CollateralManager {
    uint256 public ltvThresholdBps = 7500;
    mapping(address => uint256) public healthFactorSnapshots;

    event HealthFactorRecorded(address indexed borrower, uint256 score);

    function updateCollateralHealth(uint256 _healthScore) external {
        healthFactorSnapshots[msg.sender] = _healthScore;
        emit HealthFactorRecorded(msg.sender, _healthScore);
    }
}
