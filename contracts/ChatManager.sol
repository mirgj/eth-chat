pragma solidity ^0.4.23;
import "./ChatRoom.sol";
import "./Utils.sol";

contract ChatManager {
  mapping(bytes32 => ChatRoom) chatRooms;
  string[] public roomNames;

  constructor() public { }

  function createChatRoom(string roomName, string nickname) public {
    bytes32 id = keccak256(Utils.stringToBytes(roomName));
    require(chatRooms[id] == address(0x0));

    ChatRoom room = new ChatRoom(msg.sender, roomName, nickname);

    chatRooms[id] = room;
    roomNames.push(roomName);
  }

  function getRoomCount() public view returns(uint) {
    return roomNames.length;
  }

  function getChatRoomAddress(string roomName) public view returns(address) {
    bytes32 id = keccak256(Utils.stringToBytes(roomName));
    require(chatRooms[id] != address(0x0));

    return address(chatRooms[id]);
  }

}