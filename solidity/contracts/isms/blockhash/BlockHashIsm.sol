// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.21; // As of Solidity 0.8.21 qualified access to foreign events is allowed, supporting this usecase.

// ============ Internal Imports ============ //
import {IInterchainSecurityModule} from "../../interfaces/IInterchainSecurityModule.sol";
import {IMailbox} from "../../interfaces/IMailbox.sol";
import {Message} from "../../libs/Message.sol";
import {IMessageDispatcher} from "../../hooks/ERC5164/interfaces/IMessageDispatcher.sol"

// ============ External Imports ============ //
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";


// ============ CONTRACT ============
contract BlockHashIsm {

    // ============ Events ============
    event BlockHashISM (string currentModule);
    event Oracle (address oracle);
    event OriginChain (uint32 chainid)

    // ============ Constructor ============
    /**
     * @notice set oracle address
     */
    constructor(address _blockHashOracle) BlockHashOracle(_blockHashOracle) {
               require(
                   Address.isContract(_blockHashOracle),
                   "Invalid Oracle"
               );
           }

    // ============ Public Functions ============
    // @notice Based on feature changes to Solidity 0.8.21 enabling access to foreign events we will emit events from these contracts.
    // @notice I assume that the arbitrary bytes passed by metadata (specified by an off-chain relayer to verify messages) include the message transaction hash and validator signatures.
    function messagedispatched(address _message, bytes metadata) public view returns (bool){
        if (IInterchainSecurityModule.metadata == BlockHashOracle.TransactionHash) 
        { 
             return true;
        }  
        emit Oracle();
        emit OriginChain();
        emit BlockHashOracle.BlockHeight(); // assumed oracle event
        emit BlockHashOracle.TransactionHash(); // assumed oracle event
        emit IMessageDispatcher.MessageDispatched(); // emits bytes32 indexed messageId, address indexed from, uint256 indexed toChainId, address to, bytes data
        emit IMailbox.sol.DispatchId();
        emit BlockHashISM();
    }

  }
