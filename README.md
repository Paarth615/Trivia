# Trivia Game Smart Contract

This project is a blockchain-based trivia game where players answer questions to earn token rewards. The contract is written in Solidity and can be deployed on Ethereum testnets like Sepolia or Goerli.

## Features
- Players can answer trivia questions.
- Correct answers earn token rewards.
- The contract stores questions and hashed answers.
- Only the owner can add new questions.
- Players can check their reward balance.

## Prerequisites
Ensure you have the following installed:
- [Node.js](https://nodejs.org/)
- [Hardhat](https://hardhat.org/)
- [Metamask](https://metamask.io/)
- [Alchemy](https://www.alchemy.com/) or [Infura](https://infura.io/) API key

## Setup
1. Clone this repository:
   ```sh
   git clone https://github.com/your-repo/trivia-game.git
   cd trivia-game
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Configure Hardhat in `hardhat.config.js`:
   ```js
   require("@nomiclabs/hardhat-ethers");

   module.exports = {
       solidity: "0.8.0",
       networks: {
           sepolia: {
               url: "https://eth-sepolia.g.alchemy.com/v2/YOUR_ALCHEMY_API_KEY",
               accounts: ["YOUR_WALLET_PRIVATE_KEY"]
           }
       }
   };
   ```

## Deployment
Run the following command to deploy the contract:
```sh
npx hardhat run scripts/deploy.js --network sepolia
```

## Interacting with the Contract
You can interact using Hardhat scripts or a frontend.

### Adding a Question
Only the owner can add a question:
```solidity
addQuestion(1, "What is the capital of France?", "Paris");
```

### Answering a Question
Players can submit answers:
```solidity
submitAnswer(1, "Paris");
```

### Checking Reward Balance
Players can check their reward balance:
```solidity
getRewardBalance();
```
Contract Address:0x28D10B572029928F3d6b5F2c14bcF924CeE96DCB

## License
This project is licensed under the MIT License.

