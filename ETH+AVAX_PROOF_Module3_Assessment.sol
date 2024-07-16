pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CMToken is ERC20 {
    address public contract_admin;

    constructor() ERC20("MyToken", "MTK") {
        contract_admin = msg.sender;
        _mint(address(this), 10 * 10 ** decimals());
    }

    modifier only_contract_admin() {
        require(msg.sender == contract_admin, "Caller is not the admin");
        _;
    }

    function mint_tokens(address recipient, uint256 amount) public only_contract_admin {
        uint contract_balance = balanceOf(address(this));
        require(contract_balance >= amount, "Insufficient contract balance");
        _transfer(address(this), recipient, amount);
    }

    function burn_tokens(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer_tokens(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
}
