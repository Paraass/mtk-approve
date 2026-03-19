// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title MyToken (MTK)
 * @author Paras Aggarwal
 * @notice Full ERC-20 token implementation with approve mechanism
 * @dev Deployed on Ethereum Mainnet for a real client project
 *
 * Contract Address: 0xB5D8f34C4aCbfb550f6B3F077dfcFd6b01207038
 */
contract MyToken {

    // ─── Token Metadata ───────────────────────────────────────────
    string  public name     = "MyToken";
    string  public symbol   = "MTK";
    uint8   public decimals = 18;
    uint256 public totalSupply;

    // Tracks how many tokens each address holds
    mapping(address => uint256) public balanceOf;

    // Tracks spending permissions: owner => spender => max amount
    mapping(address => mapping(address => uint256)) public allowance;

    // ─── Events ───────────────────────────────────────────────────
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // ─── Constructor ──────────────────────────────────────────────
    constructor(uint256 _supply) {
        totalSupply           = _supply * 10 ** decimals;
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    // ─── Core ERC-20 Functions ────────────────────────────────────

    function transfer(address to, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Not enough balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to]         += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        require(allowance[from][msg.sender] >= amount, "Allowance too low");
        require(balanceOf[from] >= amount, "Not enough balance");
        allowance[from][msg.sender] -= amount;
        balanceOf[from]             -= amount;
        balanceOf[to]               += amount;
        emit Transfer(from, to, amount);
        return true;
    }
}
