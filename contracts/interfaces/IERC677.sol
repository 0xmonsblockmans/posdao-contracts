// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface IERC677 {
    // This function may only be called by Staking contract
    function stake(address _staker, uint256 _amount) external;

    // Other functions (ERC677)
    function balanceOf(address) external view returns (uint256);
    function owner() external view returns (address);
    function transfer(address, uint256) external returns (bool);
}
