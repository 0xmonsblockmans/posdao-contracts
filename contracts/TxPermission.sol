pragma solidity 0.4.25;

import "./interfaces/IValidatorSet.sol";
import "./eternal-storage/EternalStorage.sol";


contract TxPermission is EternalStorage {
    
    // ============================================== Constants =======================================================

    /// Allowed transaction types mask
    uint32 constant None = 0;
    uint32 constant All = 0xffffffff;
    uint32 constant Basic = 0x01;
    uint32 constant Call = 0x02;
    uint32 constant Create = 0x04;
    uint32 constant Private = 0x08;

    /// Addresses of `Random` and `ValidatorSet` contracts.
    /// Must be set before deploy.
    address public constant RANDOM_CONTRACT = address(0);
    address public constant VALIDATOR_SET_CONTRACT = address(0);

    // ============================================== Modifiers =======================================================

    modifier onlyOwner {
        require(msg.sender == addressStorage[OWNER]);
        _;
    }

    // =============================================== Setters ========================================================

    function addAllowedSender(address _sender) public onlyOwner {
        require(!isSenderAllowed(_sender));
        addressArrayStorage[ALLOWED_SENDERS].push(_sender);
    }

    function removeAllowedSender(address _sender) public onlyOwner {
        uint256 allowedSendersLength = addressArrayStorage[ALLOWED_SENDERS].length;

        for (uint256 i = 0; i < allowedSendersLength; i++) {
            if (_sender == addressArrayStorage[ALLOWED_SENDERS][i]) {
                addressArrayStorage[ALLOWED_SENDERS][i] = addressArrayStorage[ALLOWED_SENDERS][allowedSendersLength - 1];
                addressArrayStorage[ALLOWED_SENDERS].length--;
                break;
            }
        }
    }

    // =============================================== Getters ========================================================
    
    /// Contract name
    function contractName() public pure returns(string) {
        return "TX_PERMISSION_CONTRACT";
    }
    
    /// Contract name hash
    function contractNameHash() public pure returns(bytes32) {
        return keccak256(abi.encodePacked(contractName()));
    }
    
    /// Contract version
    function contractVersion() public pure returns(uint256) {
        return 2;
    }

    function allowedSenders() public view returns(address[]) {
        return addressArrayStorage[ALLOWED_SENDERS];
    }

    /*
     * Allowed transaction types
     * 
     * Returns:
     *  - uint32 - set of allowed transactions for #'sender' depending on tx #'to' address
     *    and value in wei.
     *  - bool - if true is returned the same permissions will be applied from the same #'sender' 
     *    without calling this contract again.
     *
     * In case of contract creation #'to' address equals to zero-address
     * 
     * Result is represented as set of flags:
     *  - 0x01 - basic transaction (e.g. ether transferring to user wallet)
     *  - 0x02 - contract call
     *  - 0x04 - contract creation
     *  - 0x08 - private transaction
     *
     * @param _sender Transaction sender address
     * @param _to Transaction recepient address
     * @param _value Value in wei for transaction
     * @param _gasPrice Gas price in wei for transaction
     * 
     */
    function allowedTxTypes(address _sender, address _to, uint256 /*_value*/, uint256 _gasPrice)
        public
        view
        returns(uint32, bool)
    {
        if (_gasPrice > 0 || isSenderAllowed(_sender)) {
            // Let `_sender` create any transactions with non-zero gas price
            // or if he is in the allowedSenders list
            return (All, false);
        }

        if (_to == RANDOM_CONTRACT && IValidatorSet(VALIDATOR_SET_CONTRACT).isValidator(_sender)) {
            // Let the validator call any function of `Random` contract with zero gas price
            return (Call, false);
        }

        if (_to == VALIDATOR_SET_CONTRACT && IValidatorSet(VALIDATOR_SET_CONTRACT).isReportValidatorValid(_sender)) {
            // Let the validator call any function of `ValidatorSet` contract with zero gas price
            return (Call, false);
        }

        // Don't let `_sender` use zero gas price for other cases
        return (None, false);
    }

    function isSenderAllowed(address _sender) public view returns(bool) {
        uint256 allowedSendersLength = addressArrayStorage[ALLOWED_SENDERS].length;

        for (uint256 i = 0; i < allowedSendersLength; i++) {
            if (_sender == addressArrayStorage[ALLOWED_SENDERS][i]) {
                return true;
            }
        }

        return false;
    }

    // =============================================== Private ========================================================

    bytes32 internal constant ALLOWED_SENDERS = keccak256("allowedSenders");
    bytes32 internal constant OWNER = keccak256("owner");
}
