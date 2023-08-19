// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.0;

// ============ Internal Imports ============ //
import {IBlockHashIsm} from "../../interfaces/isms/IBlockHashIsm.sol";
import {IInterchainSecurityModule} from "../../interfaces/IInterchainSecurityModule.sol";
import {IMailbox} from "../../interfaces/IMailbox.sol";
import {Message} from "../../libs/Message.sol";
   /** 
    * @notice This project assumes a magic onchain oracle. The oracle imported below dos not exist
    */
import {Oracle} from "../../libs/Oracle.sol";


