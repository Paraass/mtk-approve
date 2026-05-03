# ERC-20 Token Approval DApp - Tether(USDT)

> Built for a real client as a freelance blockchain project.  
> Deployed on **Ethereum Mainnet** · Live DApp hosted on GitHub Pages

---

## 🔗 Live Links

| Resource | Link |
|---|---|
| Live DApp | [paraass.github.io/mtk-approve/approve-dapp.html](https://paraass.github.io/mtk-approve/approve-dapp.html) |
| Smart Contract (Etherscan) | [0xB5D8f34C4aCbfb550f6B3F077dfcFd6b01207038](https://etherscan.io/address/0xB5D8f34C4aCbfb550f6B3F077dfcFd6b01207038) |
| Token Tracker | [ERC-20: MyToken (MTK)](https://etherscan.io/token/0xB5D8f34C4aCbfb550f6B3F077dfcFd6b01207038) |

---

## 📌 Project Overview

This project was built for a real client who needed a working ERC-20 token deployment with a frontend DApp that allows users to approve token spending via Trust Wallet.

**The complete flow:**
```
Smart Contract Deployed → QR Code Generated → User Scans with Trust Wallet → Approve/Deny Popup
```

---

## 🛠️ What Was Built

### 1. Smart Contract - `MyToken.sol`
- Full ERC-20 standard implementation written in Solidity
- Includes `approve()`, `transferFrom()`, `transfer()`, `balanceOf()`, `allowance()`
- Emits `Transfer` and `Approval` events
- 1,000,000 MTK minted to deployer on launch
- Deployed on Ethereum Mainnet via Remix IDE + Trust Wallet (WalletConnect)

### 2. Frontend DApp - `approve-dapp.html`
- Single-file HTML/CSS/JS DApp
- Connects to MetaMask and Trust Wallet via `window.ethereum`
- Calls the `approve()` function on the deployed contract
- Shows real-time transaction status and Etherscan link on success
- Hosted on GitHub Pages

### 3. QR Code
- Generated from the live DApp URL
- When scanned with Trust Wallet, opens the DApp in the built-in browser
- User can approve/deny the token request directly from their wallet

---

## 🔐 Smart Contract Details

| Property | Value |
|---|---|
| Token Name | MyToken |
| Symbol | MTK |
| Decimals | 18 |
| Total Supply | 1,000,000 MTK |
| Network | Ethereum Mainnet |
| Contract Address | `0xB5D8f34C4aCbfb550f6B3F077dfcFd6b01207038` |
| Deployer | `0xC607Dec3498756B549e45fe4385D24d6A908632B` |
| Standard | ERC-20 |

---

## 📁 Repository Structure

```
mtk-approve/
├── MyToken.sol          # Solidity smart contract
├── approve-dapp.html    # Frontend DApp (single file)
└── README.md            # This file
```

---

## 🚀 How to Deploy (for reference)

1. Open [remix.ethereum.org](https://remix.ethereum.org)
2. Paste `MyToken.sol`
3. Compile with Solidity `^0.8.20`
4. Connect wallet via Injected Provider or WalletConnect
5. Deploy with `_supply = 1000000`
6. Copy contract address and update `approve-dapp.html`
7. Host on GitHub Pages

---

## 💡 How the Approve Mechanism Works

```
Alice (token owner)
    ↓
approve(DEX, 500 MTK)       ← sets permission on blockchain
    ↓
DEX calls transferFrom()    ← uses the permission to move tokens
    ↓
Allowance reduced by 500    ← prevents overspending
```

The `approve()` function does not move tokens. It only writes a permission into blockchain state. The actual movement happens later via `transferFrom()`.

---

## 🔧 Tech Stack

- **Solidity** `^0.8.20` — Smart contract language
- **Remix IDE** — Development and deployment environment
- **Ethers.js** `v5.7.2` — Blockchain interaction in frontend
- **Trust Wallet** — Mobile wallet for testing (WalletConnect)
- **MetaMask** — Browser wallet
- **GitHub Pages** — Frontend hosting
- **Ethereum Mainnet** — Live blockchain deployment

---

## 👤 Author

**Paras Aggarwal**  
Final Year B.Tech — Computer Science, Chandigarh University  
Freelance Blockchain Developer

---

*Built and deployed for a real client. Contract is live on Ethereum Mainnet.*
