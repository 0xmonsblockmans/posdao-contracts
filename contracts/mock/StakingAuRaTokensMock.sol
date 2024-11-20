// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "./StakingAuRaBaseMock.sol";
import "../../contracts/base/StakingAuRaTokens.sol";

contract StakingAuRaTokensMock is StakingAuRaTokens, StakingAuRaBaseMock {
    function setErc677TokenContractMock(IERC677 _erc677TokenContract) public {
        erc677TokenContract = _erc677TokenContract;
    }
}
