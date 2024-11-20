// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "./base/StakingAuRaTokens.sol";
//import "./base/StakingAuRaCoins.sol";


contract StakingAuRa is StakingAuRaTokens {}

// Uncomment this line and comment out the above one
// if staking in native coins is needed instead of staking in tokens:
// contract StakingAuRa is StakingAuRaCoins {}