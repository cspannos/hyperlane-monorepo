// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.21; // As of Solidity 0.8.21 qualified access to foreign events is allowed, supporting this usecase.

import {IInterchainSecurityModule} from "../IInterchainSecurityModule.sol";

interface IBlockHashOracle {
    uint32 
    public 
    immutable 
    origin;

function blockhash(uint256 height) 
    external 
    view 
    returns(uint256 hash);
}
