// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface IBlockRewardAuRaCoins {
    function transferReward(uint256, address payable) external;
    function getDelegatorReward(
        uint256,
        uint256,
        uint256
    ) external view returns (uint256);
    function getValidatorReward(
        uint256,
        uint256
    ) external view returns (uint256);
}
