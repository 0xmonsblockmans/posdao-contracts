// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface IGovernance {
    function initialize(address) external;
    function isValidatorUnderBallot(uint256) external view returns (bool);
}
