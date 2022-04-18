pragma solidity ^0.4.17;

contract HelloWorld {
    string public latestMessage;
    address public latestAddress;
    mapping(address => string[]) public messages;

    event SendMessage(string message);

    constructor() public {
        latestMessage = 'Hello';
        latestAddress = msg.sender;
        messages[latestAddress].push(latestMessage);
    }

    function getMessage(address user, uint i) public returns(string) {
        emit SendMessage(messages[user][i]);
        return messages[user][i];
    }

    function addMessage(address user, string _message) public {
        latestMessage = _message;
        latestAddress = user;
        messages[user].push(_message);
    }

    function latestMessage() public view returns(string, address) {
        return (latestMessage, latestAddress);
    }
}