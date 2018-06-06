pragma solidity ^0.4.23;

contract ChatRoom {

  struct User {
    address id;
    string name;
    uint time;
  }
  struct Message {
    address owner;
    string message;
  }

  mapping(address => User) userInfo;
  address[] users;
  string public roomName;
  address public roomCreator;
  Message[] messages;

  constructor(address creator, string name, string creatorNickname) public { 
    roomName = name;
    roomCreator = creator;

    users.push(creator);
    userInfo[creator] = User(creator, creatorNickname, now);
  }

  function addUser(string nickname) public {
    userInfo[msg.sender] = User(msg.sender, nickname, now);
    users.push(msg.sender);
  }

  function getUserCount() public view returns(uint) {
    return users.length;
  }

  function getUserAt(uint index) public view returns(address, string, uint) {
    require(index < users.length);
    address userAddr = users[index];

    return (userInfo[userAddr].id, userInfo[userAddr].name, userInfo[userAddr].time);
  }

  function getMessageCount() public view returns(uint) {
    return messages.length;
  }

  function addMessage(string message) public {
    messages.push(Message(msg.sender, message));
  }

  function getMessageAt(uint index) public view returns(address, string) {
    require(index < messages.length);

    return (messages[index].owner, messages[index].message);
  }

}