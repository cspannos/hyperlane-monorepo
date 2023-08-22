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
    event BlockHeight(uint256 _height);
    event MessageDispatched(bool _messageDispatched);
    event MessageTxHash (uint256 transactionHash);
    event BlockHashISM (string currentModule);
    event Oracle (address oracle);

    // ============ Core Variables ============
    mapping(address => bool) public oracles; //oracles added by owner
    mapping(address => bytes) public _oraclesToBlockHash; //oracles to blockhash mapping

    // ============ Constructor ============
    /**
     * @notice setting up blockHashOracle core function below
     */
    constructor(
        address oracle,
        BlockHash _oracle,
        uint256 _height,
    ) {
        _set(oracle, _oracle);
        messageDispatched = _messageDispatched;
    }

    // ============ Public Functions ============
    MessageDispatched = msgdispatched

    function setdestoracle (address oracle);
        public
        returns (address) {
        return msgdispatched.destination_oracle)
       }

    function getchainid;() 
        public 
        returns (uint32) {
        return msgdispatched.origin_chainid;
       }

     function getblockhash;() 
         public 
         returns (uint256) {
         return msgdispatched.block_hash;
        }

    function getparenthash;() 
        public 
        view 
        returns (uint256) {
        return msgdispatched.parent_hash;
       }

    function getattestationsignatures;() 
        public  
        returns (uint256) {
        return msgdispatched.attestation_signatures;
       }

    function getstateroot;() 
        public 
        returns (uint256) {
        return msgdispatched.state_root;
       } 

    function gettransactionhash;() 
        public 
        returns (uint256) {
        return msgdispatched.execution_payload;
       }
}

// Based on feature changes to Solidity 0.8.21 enabling access to foreign events we will emit events from these contracts:
    function messagedispatched(address _message, verified) public {
        emit BlockHashOracle.BlockHeight(); // assumed oracle event
        emit BlockHashOracle.TransactionHash(); // assumed oracle event
        emit IMessageDispatcher.MessageDispatched();
        emit IMailbox.sol.DispatchId();
    }



