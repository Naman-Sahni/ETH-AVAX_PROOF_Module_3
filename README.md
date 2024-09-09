 # Deploy Smart Contract on Hardhat network and access it through Remix IDE

This project is a part of Metacrafters ETH+AVAX course assessment.

In this project, we had to create a custom token using a smart contract, deploy it on the local hardhat network, and use Remix IDE to interact with it.
# divneettoken

This repository contains the Solidity smart contract for the KiranjotToken (KJT), an ERC20 token. The contract is implemented using OpenZeppelin's libraries for security and best practices.

## Contract Details

- **Token Name:** Naman
- **Token Symbol:** NHT

## Features

1. **Minting:** Only the owner of the contract can mint new tokens.
2. **Burning:** Any token holder can burn their tokens.
3. **Balance Query:** Get the balance of a specific address.

## Dependencies

The contract uses OpenZeppelin's ERC20 and Ownable contracts. Ensure you have OpenZeppelin contracts installed in your project.
# Contract code

     // SPDX-License-Identifier: MIT
     pragma solidity ^0.8.18;

    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
    import "@openzeppelin/contracts/access/Ownable.sol";

    contract KiranjotToken is ERC20, Ownable(msg.sender) {
    constructor() ERC20("Kiran jot", "KJT") {
       
    }

    // Override the OpenZeppelin mint function to restrict it to the owner
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from the caller's balance
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Additional function to get the balance of a specific address
    function getBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}


## Usage


Deploying the Contract
To deploy the contract, use your preferred Ethereum development environment, such as Truffle, Hardhat, or Remix.

Minting Tokens
Only the owner of the contract can mint new tokens.

## solidity

function mint(address to, uint256 amount) external onlyOwner {
    _mint(to, amount);
}

# Burning Tokens
Any token holder can burn their tokens.

## solidity

function burn(uint256 amount) external {
    _burn(msg.sender, amount);
}
## Checking Balances
You can check the balance of any address using the getBalance function.

function getBalance(address account) external view returns (uint256) {
    return balanceOf(account);
}

### Author: Naman

