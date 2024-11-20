// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "../../contracts/Governance.sol";

contract GovernanceMock is Governance {
    uint256 internal _currentBlockNumber;

    // =============================================== Setters ========================================================

    function setCurrentBlockNumber(uint256 _blockNumber) public {
        _currentBlockNumber = _blockNumber;
    }

    // =============================================== Getters ========================================================

    function getCurrentBlockNumber() public view returns (uint256) {
        return _getCurrentBlockNumber();
    }

    // =============================================== Private ========================================================

    function _getCurrentBlockNumber() internal view returns (uint256) {
        return _currentBlockNumber;
    }
}
