// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.0;

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
