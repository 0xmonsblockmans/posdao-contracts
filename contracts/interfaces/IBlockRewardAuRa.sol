// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface IBlockRewardAuRa {
    function clearBlocksCreated() external;
    function initialize(address, address) external;
    function epochsPoolGotRewardFor(
        uint256
    ) external view returns (uint256[] memory);
    function mintedTotally() external view returns (uint256);
    function mintedTotallyByBridge(address) external view returns (uint256);
}
