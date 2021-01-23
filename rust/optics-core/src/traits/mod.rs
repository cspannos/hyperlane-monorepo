/// Interface for home chain contract
pub mod home;

/// Interface for replica chain contract
pub mod replica;

use async_trait::async_trait;
use ethers_core::types::{TransactionReceipt, H256};
use thiserror::Error;

use crate::{utils::domain_hash, SignedUpdate};

pub use home::*;
pub use replica::*;

/// Contract states
#[derive(Debug)]
pub enum State {
    /// Contract is active
    Waiting,
    /// Contract has failed
    Failed,
}

/// The result of a transaction
#[derive(Debug)]
pub struct TxOutcome {
    /// The txid
    pub txid: H256,
    /// True if executed, false otherwise (reverted, etc.)
    pub executed: bool,
    // TODO: more? What can be abstracted across all chains?
}

impl From<TransactionReceipt> for TxOutcome {
    fn from(t: TransactionReceipt) -> Self {
        Self {
            txid: t.transaction_hash,
            executed: t.status.unwrap().low_u32() == 1,
        }
    }
}

#[derive(Debug, Error)]
/// Error type for chain communication
pub enum ChainCommunicationError {
    /// Provider Error
    #[error(transparent)]
    ProviderError(#[from] ethers_providers::ProviderError),
    /// Contract Error
    #[error(transparent)]
    ContractError(Box<dyn std::error::Error>),
    /// Custom error or contract error
    #[error(transparent)]
    CustomError(#[from] Box<dyn std::error::Error>),
}

impl<M> From<ethers_contract::ContractError<M>> for ChainCommunicationError
where
    M: ethers_providers::Middleware + 'static,
{
    fn from(e: ethers_contract::ContractError<M>) -> Self {
        Self::ContractError(Box::new(e))
    }
}

/// Interface for attributes shared by Home and Replica
#[async_trait]
pub trait Common: Sync + Send + std::fmt::Debug {
    /// Get the status of a transaction
    async fn status(&self, txid: H256) -> Result<Option<TxOutcome>, ChainCommunicationError>;

    /// Return the slip44 ID
    fn origin_slip44(&self) -> u32;

    /// Return the domain hash
    fn domain_hash(&self) -> H256 {
        domain_hash(self.origin_slip44())
    }

    /// Fetch the current updater value
    async fn updater(&self) -> Result<H256, ChainCommunicationError>;

    /// Fetch the current state.
    async fn state(&self) -> Result<State, ChainCommunicationError>;

    /// Fetch the current root
    async fn current_root(&self) -> Result<H256, ChainCommunicationError>;

    /// Submit a signed update for inclusion
    async fn update(&self, update: &SignedUpdate) -> Result<TxOutcome, ChainCommunicationError>;

    /// Submit a double update for slashing
    async fn double_update(
        &self,
        left: &SignedUpdate,
        right: &SignedUpdate,
    ) -> Result<TxOutcome, ChainCommunicationError>;
}