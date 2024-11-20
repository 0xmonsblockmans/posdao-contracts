// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface ITokenMinter {
    // This function may only be called by BlockReward contract
    function mintReward(uint256 _amount) external;

    function blockRewardContract() external view returns (address);
    function tokenContract() external view returns (address);
}
