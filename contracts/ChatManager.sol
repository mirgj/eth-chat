pragma solidity ^0.4.23;
import "./ChatRoom.sol";
import "./Utils.sol";

contract ChatManager {
  mapping(bytes32 => ChatRoom) chatRooms;
  uint public roomCount;

  constructor() public { }

  function createChatRoom(string name, string nickname) public {
    bytes32 id = keccak256(Utils.stringToBytes(name));
    require(chatRooms[id] == address(0x0));

    ChatRoom room = new ChatRoom(name, msg.sender, nickname);

    chatRooms[id] = room;
    roomCount++;
  }

  function getChatRoomAddress(string name) public view returns(address) {
    bytes32 id = keccak256(Utils.stringToBytes(name));
    require(chatRooms[id] != address(0x0));

    return address(chatRooms[id]);
  }

}