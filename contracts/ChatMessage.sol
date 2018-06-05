pragma solidity ^0.4.23;

contract ChatMessage {

  address public owner;
  string public message;

  constructor(address _owner, string _message) public { 
    owner = _owner;
    message = _message;
  }

}