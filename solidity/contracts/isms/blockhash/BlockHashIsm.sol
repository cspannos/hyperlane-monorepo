// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.21; // As of Solidity 0.8.21 qualified access to foreign events is allowed, supporting this usecase.

// ============ Internal Imports ============ //
import {IInterchainSecurityModule} from "../../interfaces/IInterchainSecurityModule.sol";
import {IMailbox} from "../../interfaces/IMailbox.sol";
import {Message} from "../../libs/Message.sol";
import {IMessageDispatcher} "../../hooks/ERC5164/interfaces/IMessageDispatcher.sol"

// ============ External Imports ============ //
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";


// ============ CONTRACT ============
contract BlockHashIsm {

    // ============ Events ============
    event BlockHashISM (string currentModule);
    event Oracle (address oracle);

    // ============ Constructor ============
    /**
     * @notice set oracle address
     */
    constructor(address _destinationChainOracle) DestinationChainOracle(_destinationChainOracle) {
               require(
                   Address.isContract(_destinationChainOracle),
                   "Hyperlane Oracle: Invalid Oracle"
               );
           }}

    // ============ Public Functions ============
// Based on feature changes to Solidity 0.8.21 enabling access to foreign events we will emit events from these contracts:
    function messagedispatched(address _message, verified) public {
        emit BlockHashOracle.BlockHeight(); // assumed oracle event
        emit BlockHashOracle.TransactionHash(); // assumed oracle event
        emit IMessageDispatcher.MessageDispatched();
        emit IMailbox.sol.DispatchId();
    }
  }

