pragma solidity ^0.4.13;

import "./Ownable.sol";

 /// @title Can be killed by owner. All ETHs will be send to the owner.
contract Killable is Ownable {
  function kill() onlyOwner {
    selfdestruct(owner);
  }
}
