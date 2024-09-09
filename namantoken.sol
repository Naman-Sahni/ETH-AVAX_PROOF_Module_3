// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract namantoken {
    string public tokenName = "naman";
    string public tokenAbbr = "NHT";

    address owner;

    mapping(address => uint) record;

    constructor() {
        owner = msg.sender;
    }

    function getBalance() external view returns (uint) {
        return record[msg.sender];
    }

    // New function to fetch balance by inputting an account address
    function getBalanceOf(address account) external view returns (uint) {
        return record[account];
    }

    function mint(address to, uint amount) external {
        require(msg.sender == owner, "Only owner can mint tokens");
        record[to] += amount;
    }

    function transferTo(address to, uint amount) external {
        require(record[msg.sender] >= amount, "Insufficient balance in the account");
        record[to] += amount;
        record[msg.sender] -= amount;
    }

    function burn(uint amount) external {
        require(record[msg.sender] >= amount, "Insufficient balance in the account");
        record[msg.sender] -= amount;
    }
}
