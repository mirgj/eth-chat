pragma solidity ^0.4.23;
import "./ChatRoom.sol";

contract ChatManager {
  mapping(bytes32 => ChatRoom) chatRooms;
  uint public roomCount;

  constructor() public { }

  function createChatRoom(string name, string nickname) public {
    bytes32 id = keccak256(stringToBytes32(name));
    require(chatRooms[id] == address(0x0));

    ChatRoom room = new ChatRoom(name, msg.sender, nickname);

    chatRooms[id] = room;
    roomCount++;
  }

  function getChatAddress(string name) public view returns(address) {
    bytes32 id = keccak256(stringToBytes32(name));
    require(chatRooms[id] != address(0x0));

    return address(chatRooms[id]);
  }

  function stringToBytes32(string memory source) internal pure returns (bytes) {
    bytes memory result = bytes(source);
    
    return result;
  }

}