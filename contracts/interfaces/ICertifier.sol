// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

interface ICertifier {
    function certifiedExplicitly(address) external view returns (bool);
    function initialize(address[] calldata, address) external;
}
