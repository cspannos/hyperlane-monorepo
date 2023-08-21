// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.0;

// ============ Internal Imports ============ //
import {IBlockHashIsm} from "../../interfaces/isms/IBlockHashIsm.sol";
import {IInterchainSecurityModule} from "../../interfaces/IInterchainSecurityModule.sol";
import {IMailbox} from "../../interfaces/IMailbox.sol";
import {Message} from "../../libs/Message.sol";
   /** 
    * @notice This project assumes an onchain oracle on the destination chain. The oracle imported below is mock only and does not exist.
    */
import {DestinationChainOracle} from "../../libs/DestinationChainOracle.sol";

// ============ External Imports ============ //
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";


// ============ CONTRACT ============
contract BlockHashIsm is IBlockHashIsm, Ownable {

    // ============ Events ============
    event BlockHeight(uint256 _height);
    event MessageDispatched(bool _messageDispatched);
    event MessageTxHash (uint256 transactionHash);
    event BlockHashISM (string currentModule);
    event Oracle (address oracle);

    // ============ Struct ============
    struct MessageDispatched {
        uint32 origin_chainid;
        uint256 block_hash;
        uint256 parent_hash;
        uint256 attestation_signatures;
        uint256 state_root;
        }    

    // ============ Core Variables ============
    mapping(address => bool) public oracles; //oracles added by owner
    mapping(address => bytes) public _oraclesToBlockHash; //oracles to blockhash mapping

    /**
     * @notice To do: add oracle timeout variables
     * @notice To do: add function to ping oracle
     */
    // ============ Custom Errors ============
    error OracleDown(address attemptedAccess);

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






