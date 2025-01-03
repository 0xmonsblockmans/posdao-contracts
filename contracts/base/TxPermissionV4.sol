// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "./TxPermissionBase.sol";


contract TxPermissionV4 is TxPermissionBase {

    // =============================================== Getters ========================================================

    /// @dev Returns the contract's version number needed for node's engine.
    function contractVersion() public pure returns(uint256) {
        return 4;
    }

    /// @dev Defines the allowed transaction types which may be initiated by the specified sender with
    /// the specified gas price and data. Used by node's engine each time a transaction is about to be
    /// included into a block. See https://openethereum.github.io/Permissioning.html#how-it-works-1
    /// @param _sender Transaction sender address.
    /// @param _to Transaction recipient address. If creating a contract, the `_to` address is zero.
    /// @param _value Transaction amount in wei.
    /// @param _maxFeePerGas The `maxFeePerGas` in Wei for EIP-1559 transaction, or gas price for a legacy transaction.
    /// @param _maxPriorityFeePerGas The `maxPriorityFeePerGas` in Wei for EIP-1559 transaction.
    /// Equals to gas price for a legacy transaction.
    /// @param _gasLimit Gas limit for the transaction.
    /// @param _data Transaction data.
    /// @return `uint32 typesMask` - Set of allowed transactions for `_sender` depending on tx `_to` address,
    /// `_gasPrice`, and `_data`. The result is represented as a set of flags:
    /// 0x01 - basic transaction (e.g. ether transferring to user wallet);
    /// 0x02 - contract call;
    /// 0x04 - contract creation;
    /// 0x08 - private transaction.
    /// `bool cache` - If `true` is returned, the same permissions will be applied from the same
    /// `_sender` without calling this contract again.
    function allowedTxTypes(
        address _sender,
        address _to,
        uint256 _value,
        uint256 _maxFeePerGas, // equals to gasPrice for legacy transactions
        uint256 _maxPriorityFeePerGas, // equals to gasPrice for legacy transactions
        uint256 _gasLimit,
        bytes memory _data
    )
        public
        view
        returns(uint32 typesMask, bool cache)
    {
        return _allowedTxTypes(_sender, _to, _value, _maxFeePerGas, _maxPriorityFeePerGas, _gasLimit, _data);
    }

}
