# 🖼️ First NFT Collection

**First NFT Collection** is a simple ERC721 smart contract developed with Foundry. It allows the creation of a customizable NFT collection, including its name, symbol, base URI, and total supply. This project serves as a foundational step into the world of NFTs using Solidity and modern tooling.

> [!NOTE]
> This contract uses OpenZeppelin libraries to ensure security and ERC721 standard compliance.

---

## 🔹 Key Features

- ✅ Custom ERC721 NFT contract with constructor parameters (name, symbol, base URI, total supply).
- ✅ Deployed on **Arbitrum One**.
- ✅ Successfully **verified** on Arbiscan.
- ✅ Deployment via Foundry scripting (`forge script`).

---

## 🖉 Contract Flow Diagram

![First NFT Flow Diagram](https://github.com/Sulvank/first-nft/blob/main/diagrams/first_nft_flow.png)

---

## 📄 Deployed Contract

| 🔧 Item                  | 📋 Description                                                                 |
|--------------------------|---------------------------------------------------------------------------------|
| **Contract Name**        | `FirstNFTCollection`                                                           |
| **Deployed Network**     | Arbitrum One                                                                   |
| **Contract Address**     | [`0xE746F38E6B62d249301190d8C2523B7Ad5eCf005`](https://arbiscan.io/address/0xE746F38E6B62d249301190d8C2523B7Ad5eCf005) |
| **Verified on Arbiscan**| ✅ Yes                                                                          |
| **Constructor Parameters** | `string name`, `string symbol`, `uint256 totalSupply`, `string baseUri`      |

---

## 🚀 How to Use Locally

### 1️⃣ Clone and Set Up

```bash
git clone https://github.com/Sulvank/first-nft.git
cd first-nft
2️⃣ Install Foundry
bash
Copiar
Editar
curl -L https://foundry.paradigm.xyz | bash
foundryup
3️⃣ Deploy the Contract
bash
Copiar
Editar
forge script script/DeployNFTColecction.s.sol \
  --rpc-url https://arb1.arbitrum.io/rpc \
  --broadcast --verify
Replace the constructor parameters in the deployment script as needed.

🧠 Project Structure
bash
Copiar
Editar
first-nft/
├── lib/                        # OpenZeppelin libraries
├── script/
│   └── DeployNFTColecction.s.sol  # Deployment script using Foundry
├── src/
│   └── FirstNFTCollection.sol     # Main ERC721 contract
├── .env                       # Environment variables (e.g., RPC URL, private key)
├── foundry.toml               # Foundry configuration
└── README.md                  # Project documentation
🔍 Contract Summary
Functions
Function	Description
constructor(...)	Initializes the collection (name, symbol, supply, URI)
mint(address to, uint256 tokenId)	Mints a new NFT and assigns it to a user
tokenURI(uint256 tokenId)	Returns the URI for the given token ID

🛠️ Potential Improvements
🎨 Add support for metadata URIs via IPFS or centralized storage.

🔄 Implement IERC721Enumerable for full OpenSea compatibility.

🔐 Add role-based access control (e.g., only owner can mint).

🌐 Build a front-end to interact with the collection.

🧪 Tests
❌ No unit tests written yet. You can add forge test coverage for:

Constructor parameter validation

Minting logic

URI formatting

📜 License
This project is licensed under the MIT License. See the LICENSE file for details.