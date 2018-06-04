pragma solidity ^0.4.23;

contract ChatRoom {

  struct User {
    address id;
    string name;
    uint time;
  }
  string public roomName;
  address public roomCreator;
  User[] public users;

  constructor(string name, address creator, string creatorNickname) public { 
    roomName = name;
    roomCreator = creator;

    users.push(User(creator, creatorNickname, now));
  }

  function addUser(address user, string nickname) public {
    users.push(User(user, nickname, now));
  }

  function getUserCount() public view returns(uint) {
    return users.length;
  }

  function getUserAt(uint index) public view returns(address, string, uint) {
    require(index < users.length - 1);

    return (users[index].id, users[index].name, users[index].time);
  }

}