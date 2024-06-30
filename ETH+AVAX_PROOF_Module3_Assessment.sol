// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public token_name;
    string public token_symbol;
    uint8 public token_decimals;
    uint256 public total_supply;
    address public contract_owner;

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    modifier only_owner {
        require(msg.sender == contract_owner, "Only the contract owner can execute this function");
        _;
    }

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initial_supply) {
        token_name = _name;
        token_symbol = _symbol;
        token_decimals = _decimals;
        total_supply = _initial_supply * 10**uint256(_decimals);
        contract_owner = msg.sender;
        balances[contract_owner] = total_supply;
    }

    function transfer(address _to, uint256 _value) external {
        require(_to != address(0), "Invalid recipient address");
        require(balances[msg.sender] >= _value, "Insufficient balance");

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
    }

    function approve(address _spender, uint256 _value) external {
        require(_spender != address(0), "Invalid spender address");

        allowances[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
    }

    function transfer_from(address _from, address _to, uint256 _value) external {
        require(_from != address(0), "Invalid sender address");
        require(_to != address(0), "Invalid recipient address");
        require(balances[_from] >= _value, "Insufficient balance");
        require(allowances[_from][msg.sender] >= _value, "Allowance exceeded");

        balances[_from] -= _value;
        balances[_to] += _value;
        allowances[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
    }

    function mint(address _to, uint256 _value) external only_owner {
        require(_to != address(0), "Invalid recipient address");
        require(_value > 0, "Mint amount must be greater than zero");

        total_supply += _value;
        balances[_to] += _value;

        emit Mint(_to, _value);
    }

    function burn(uint256 _value) external {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        require(_value > 0, "Burn amount must be greater than zero");

        total_supply -= _value;
        balances[msg.sender] -= _value;

        emit Burn(msg.sender, _value);
    }

    function increase_allowance(address _spender, uint256 _added_value) external {
        require(_spender != address(0), "Invalid spender address");

        allowances[msg.sender][_spender] += _added_value;

        emit Approval(msg.sender, _spender, allowances[msg.sender][_spender]);
    }

    function decrease_allowance(address _spender, uint256 _subtracted_value) external {
        require(_spender != address(0), "Invalid spender address");
        uint256 current_allowance = allowances[msg.sender][_spender];
        require(current_allowance >= _subtracted_value, "Decreased allowance below zero");

        allowances[msg.sender][_spender] = current_allowance - _subtracted_value;

        emit Approval(msg.sender, _spender, allowances[msg.sender][_spender]);
    }

}
