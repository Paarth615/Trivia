// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TriviaGame {
    address public owner;
    mapping(uint256 => string) private questions;
    mapping(uint256 => bytes32) private answers;
    mapping(address => uint256) public rewards;
    uint256 public questionCount;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addQuestion(uint256 id, string memory question, string memory answer) public onlyOwner {
        questions[id] = question;
        answers[id] = keccak256(abi.encodePacked(answer));
        questionCount++;
    }

    function getQuestion(uint256 id) public view returns (string memory) {
        return questions[id];
    }

    function submitAnswer(uint256 id, string memory answer) public {
        require(answers[id] != 0, "Question does not exist");
        if (keccak256(abi.encodePacked(answer)) == answers[id]) {
            rewards[msg.sender] += 1;
        }
    }

    function getRewardBalance() public view returns (uint256) {
        return rewards[msg.sender];
    }
}
