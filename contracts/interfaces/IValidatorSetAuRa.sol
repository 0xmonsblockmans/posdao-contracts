// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface IValidatorSetAuRa {
    function addPool(
        address,
        address,
        string calldata,
        string calldata
    ) external returns (uint256);
    function initialize(
        address,
        address,
        address,
        address,
        address[] calldata,
        address[] calldata,
        bool
    ) external;
    function newValidatorSet() external;
    function removeMaliciousValidators(address[] calldata) external;
    function removeValidator(uint256, uint256, bytes32) external;
    function areDelegatorsBanned(address) external view returns (bool);
    function areIdDelegatorsBanned(uint256) external view returns (bool);
    function blockRewardContract() external view returns (address);
    function changeRequestCount() external view returns (uint256);
    function emitInitiateChangeCallable() external view returns (bool);
    function getPendingValidators() external view returns (address[] memory);
    function getPendingValidatorsIds() external view returns (uint256[] memory);
    function getValidators() external view returns (address[] memory);
    function getValidatorsIds() external view returns (uint256[] memory);
    function hasEverBeenMiningAddress(address) external view returns (uint256);
    function idByMiningAddress(address) external view returns (uint256);
    function idByStakingAddress(address) external view returns (uint256);
    function isReportValidatorValid(address, bool) external view returns (bool);
    function isUnremovableValidator(uint256) external view returns (bool);
    function isValidator(address) external view returns (bool);
    function isValidatorById(uint256) external view returns (bool);
    function isValidatorBanned(address) external view returns (bool);
    function isValidatorIdBanned(uint256) external view returns (bool);
    function isValidatorOrPending(uint256) external view returns (bool);
    function MAX_VALIDATORS() external view returns (uint256); // solhint-disable-line func-name-mixedcase
    function miningAddressById(uint256) external view returns (address);
    function miningAddressChangeRequest()
        external
        view
        returns (uint256, address);
    function miningByStakingAddress(address) external view returns (address);
    function randomContract() external view returns (address);
    function reportMaliciousCallable(
        address,
        address,
        uint256
    ) external view returns (bool, bool);
    function stakingAddressById(uint256) external view returns (address);
    function stakingByMiningAddress(address) external view returns (address);
    function stakingContract() external view returns (address);
    function validatorSetApplyBlock() external view returns (uint256);
    function validatorsToBeFinalized()
        external
        view
        returns (address[] memory, bool);
    function validatorsToBeFinalizedIds()
        external
        view
        returns (uint256[] memory);
}
