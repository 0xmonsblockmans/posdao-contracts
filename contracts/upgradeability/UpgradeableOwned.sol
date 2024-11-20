// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "./UpgradeabilityAdmin.sol";

contract UpgradeableOwned is UpgradeabilityAdmin {
    /// @dev Access check: revert unless `msg.sender` is the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == _admin());
        _;
    }
}
