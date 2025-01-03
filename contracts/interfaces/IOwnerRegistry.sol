// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface IOwnerRegistry {
    event Reserved(bytes32 indexed name, address indexed owner);
    event Transferred(
        bytes32 indexed name,
        address indexed oldOwner,
        address indexed newOwner
    );
    event Dropped(bytes32 indexed name, address indexed owner);

    function getOwner(bytes32 _name) external view returns (address);
}
