// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CeloTransfer {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function sendCELO(address payable to, uint256 amount) public {
        require(msg.sender == owner, "Yetkisiz!");
        require(address(this).balance >= amount, "Yetersiz bakiye");
        to.transfer(amount);
    }

    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
