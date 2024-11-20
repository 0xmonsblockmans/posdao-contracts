// // SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

// contract RecipientMock {
//     address public from;
//     uint256 public value;
//     string public customString;

//     function onTokenTransfer(
//         address _from,
//         uint256 _value,
//         bytes calldata _data
//     ) external returns (bool) {
//         from = _from;
//         value = _value;
//         customString = abi.decode(_data, (string));
//     }
// }

contract RecipientMock {
    address public from;
    uint256 public value;
    string public customString;

    /**
     * @dev Hook that gets called during token transfers.
     * Decodes custom data sent along with the transfer.
     * @param _from The address sending the tokens.
     * @param _value The amount of tokens sent.
     * @param _data Encoded data that contains additional information.
     * @return success Always returns true if successful.
     */
    function onTokenTransfer(
        address _from,
        uint256 _value,
        bytes calldata _data
    ) external returns (bool success) {
        from = _from;
        value = _value;

        // Decode the data into a string
        customString = abi.decode(_data, (string));

        // Indicate success
        return true;
    }
}
