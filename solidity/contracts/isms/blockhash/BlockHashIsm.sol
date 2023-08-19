// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.0;

// ============ Internal Imports ============ //
import {IBlockHashIsm} from "../../interfaces/isms/IBlockHashIsm.sol";
import {IInterchainSecurityModule} from "../../interfaces/IInterchainSecurityModule.sol";
import {IMailbox} from "../../interfaces/IMailbox.sol";
import {Message} from "../../libs/Message.sol";
   /** 
    * @notice This project assumes a magic onchain oracle. The oracle imported below dose not exist
    */
import {Oracle} from "../../libs/Oracle.sol";

// ============ External Imports ============ //
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

// ============ CONTRACT ============
abstract contract BlockHashISM is IBlockHashIsm, Ownable {

    // ============ Events ============
    event BlockHash(uint256 _height);
