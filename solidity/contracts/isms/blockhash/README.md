## About this BlockHashISM Proof-of-Concept
BlockHashISM is an Interchain Security Module that verifies whether a message was dispatched on the origin chain using an, assumed, magical origin chain block hash oracle on the destination chain. 

It relies on the ISM interface `metadata` function, which passes arbitrary bytes (specified by an off-chain relayer to verify messages) including the message transaction hash and validator signatures. It utilises [Solidity 0.8.21](https://soliditylang.org/blog/2023/07/19/solidity-0.8.21-release-announcement/) to enable qualified access to foreign events defined in contracts and interfaces that the current contract does not inherit from. This BlockHashISM PoC verifies whether a message was dispatched on the origin chain:

```library   L { event EL(); }
interface I { event EI(); }
contract  C { event EC(); }
contract  D { event ED(); }

contract E is D {
    event EE();

    function foo() public {
        emit L.EL();
        emit I.EI(); // Not allowed on 0.8.20
        emit C.EC(); // Not allowed on 0.8.20
        emit ED();
        emit EE();
    }
}
```

### Assumptions: 
- The BlockHashOracle is trusted
- Relayers are untrusted
- The origin chain uses the Ethereum block format
