# ETH-AVAX_PROOF_Module_3
Module 3 Project: Create and Mint Token


# MyToken Smart Contract

MyToken is a basic ERC-20 token implemented in Solidity. It provides functionalities for token transfers, allowance management, minting, and burning of tokens.

## Features

- **Token Name**: Customize the name of the token during deployment.
- **Token Symbol**: Customize the symbol of the token during deployment.
- **Decimals**: Define the number of decimal places for token amounts.
- **Total Supply**: Set the initial total supply of tokens.
- **Owner**: Deployer of the contract becomes the initial owner.

## Functions

### `transfer`

Transfer tokens from sender's account to another address.

### `approve`

Allow another address to spend tokens on your behalf.

### `transfer_from`

Transfer tokens from one address to another using the allowance mechanism.

### `mint`

Create new tokens and assign them to a specified address. Only the contract owner can mint tokens.

### `burn`

Destroy tokens from the sender's account.

### `increase_allowance`

Increase the allowance for another address to spend tokens on your behalf.

### `decrease_allowance`

Decrease the allowance for another address to spend tokens on your behalf.

## Events

- `Transfer`: Triggered when tokens are transferred.
- `Approval`: Triggered when an allowance is approved.
- `Mint`: Triggered when new tokens are minted.
- `Burn`: Triggered when tokens are burned.

## Usage

1. **Deployment**: Deploy the contract with desired token details.
2. **Transfers**: Use `transfer` to send tokens to another address.
3. **Allowances**: Use `approve` to approve spending and `transfer_from` to execute transfers on behalf of another address.
4. **Token Management**: Use `mint` to create new tokens (only for the owner) and `burn` to reduce the token supply.
5. **Allowance Management**: Adjust allowances with `increase_allowance` and `decrease_allowance`.
