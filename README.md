# ETH-AVAX_PROOF_Module_3
Module 3 Project: Create and Mint Token

# CMToken Smart Contract

## Overview
`CMToken` is an ERC20 token smart contract built on the Ethereum blockchain using the Solidity programming language. This contract utilizes the OpenZeppelin ERC20 implementation and adds additional functionality for minting and burning tokens. The contract is managed by an admin who has exclusive rights to mint new tokens.

## Features
- **Admin Controlled:** The contract has an admin address (`contract_admin`) who has special privileges.
- **Minting Tokens:** The admin can mint tokens to a specified recipient.
- **Burning Tokens:** Any token holder can burn their own tokens.
- **Transferring Tokens:** Token holders can transfer tokens to other addresses.

## Functions

### `constructor()`
- Sets the deployer of the contract as the `contract_admin`.
- Mints an initial supply of tokens (10 MTK) to the contract itself.

### `only_contract_admin` (modifier)
- Ensures that only the `contract_admin` can call certain functions.

### `mint_tokens(address recipient, uint256 amount)`
- Mints tokens from the contract's balance to the specified recipient.
- Can only be called by the `contract_admin`.
- Requires the contract to have a sufficient balance of tokens to mint.

### `burn_tokens(uint256 amount)`
- Allows any token holder to burn a specified amount of their tokens.

### `transfer_tokens(address recipient, uint256 amount)`
- Allows token holders to transfer tokens to another address.
- Returns `true` if the transfer is successful.

## Usage

### Deploying the Contract
1. Deploy the contract on an Ethereum-compatible blockchain.
2. The deployer address will automatically become the `contract_admin`.

### Minting Tokens
- Only the `contract_admin` can call the `mint_tokens` function:
  ```solidity
  mint_tokens(address recipient, uint256 amount)

