// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface IMetadataRegistry {
    event DataChanged(bytes32 indexed name, string key, string plainKey);

    function getData(
        bytes32 _name,
        string calldata _key
    ) external view returns (bytes32);

    function getAddress(
        bytes32 _name,
        string calldata _key
    ) external view returns (address);

    function getUint(
        bytes32 _name,
        string calldata _key
    ) external view returns (uint);
}
