# NonEcom Smart Contract

A smart contract project for managing products and orders on the Ethereum blockchain using Hardhat.

## Description
This project includes a smart contract (`NonEcom`) for creating and managing products, processing orders, and handling payments. It also includes deployment and verification scripts using Hardhat and Etherscan.

## Features
- Product listing with details (name, category, image, price, stock)
- Order management with timestamp
- Purchase and withdrawal functionality
- Etherscan verification support

## Installation

### Prerequisites
- Node.js (>= 14.x)
- Hardhat
- Ethereum wallet (e.g., MetaMask)
- Etherscan API Key (for verification)

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/AbushakerJamil/non-ecom.git

2. Install dependencies
    pnpm install

3. Configure environment variables:

    Create a .env file and add your Etherscan API key:
    ETHERSCAN_API_KEY=your_api_key,
    PRIVATE_KEY = "",
    SAPOLIA_RPC_URL = ""

3. Compile the contract
    pnpm hardhat compile

4. Usage
    Deploy the Contract

    Run the deployment script:
    npx hardhat run scripts/deploy.js --network <network-name>

5. Verify on Etherscan

    node scripts/verify.js <contract-address> []
    1. Replace <contract-address> with the deployed contract address.
    2. Use empty [] as constructor arguments if none are required.

Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.
License

This project is licensed under the MIT License - see the LICENSE file for details.
Contact

GitHub: AbushakerJamil
Email: abushakerjamil254@gmail.com

Acknowledgements

Thanks to the Hardhat and OpenZeppelin communities for their tools and documentation.

ChatGPT said:
Changes:

Replaced npm install with pnpm install.

The rest of the steps remain unchanged as using pnpm does not require significant modifications to other steps.
