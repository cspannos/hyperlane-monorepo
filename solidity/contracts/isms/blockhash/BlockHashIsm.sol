// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.0;

// ============ Internal Imports ============ //
import {IBlockHashIsm} from "../../interfaces/isms/IBlockHashIsm.sol";
import {IInterchainSecurityModule} from "../../interfaces/IInterchainSecurityModule.sol";
import {IMailbox} from "../../interfaces/IMailbox.sol";
import {Message} from "../../libs/Message.sol";
   /** 
    * @notice This project assumes an onchain oracle. The oracle imported below is mock only and does not exist.
    */
import {Oracle} from "../../libs/Oracle.sol";

// ============ External Imports ============ //
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

// ============ CONTRACT ============
abstract contract BlockHashISM is IBlockHashIsm, Ownable {

    // ============ Events ============
    event BlockHash(uint256 _height);
    event MessageDispatched(bool _messageDispatched);
    event BlockHeight (uint256 execution_payload_header.block_hash)
    event BlockHashISM (string currentModule)
    event Oracle (address oracle)

    // ============ Core Variables ============
    mapping(address => bool) public oracles; //oracles added by owner
    mapping(address => bytes) public _oraclesToBlockHash; //oracles to blockhash mapping

    /**
     * @notice To do: add oracle timeout variables
    */
    // ============ Custom Errors ============
    error OracleDown(address attemptedAccess);

    // ============ Constructor ============
    constructor(
        address oracle,
        BlockHash _oracle,
        uint256 _height,
    ) {
        _set(oracle, _oracle);
        messageDispatched = _messageDispatched;
    }




