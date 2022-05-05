//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract MessageFeed {
    enum CATEGORY{POLITICS, SCIENCE, GAMES, FINANCE}
    
    struct message {
        address publisher;
        string message;
    }

    //Events
    event PostMessage(CATEGORY _category, message _message);

    constructor(string memory _message) {
        message memory initMessage = message(msg.sender, _message);
        emit PostMessage(CATEGORY.POLITICS, initMessage);
        emit PostMessage(CATEGORY.SCIENCE, initMessage);
        emit PostMessage(CATEGORY.GAMES, initMessage);
        emit PostMessage(CATEGORY.FINANCE, initMessage);
    }


    function publish(CATEGORY _category, string memory _publisherMessage) payable public {
        message memory publisherMessage = message(msg.sender, _publisherMessage);
        emit PostMessage(_category, publisherMessage);
    }

    function validCategory(CATEGORY _category) private pure returns (bool) {
        return _category == CATEGORY.POLITICS || _category == CATEGORY.SCIENCE || 
        _category == CATEGORY.GAMES || _category == CATEGORY.FINANCE;
    }
}
