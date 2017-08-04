pragma solidity ^0.4.13;

import "./Ownable.sol";

/// @title Allows children to implement an emergency stop mechanism.
contract Haltable is Ownable {
  bool public halted;

  modifier stopInEmergency {
    if (halted) revert();
    _;
  }

  modifier onlyInEmergency {
    if (!halted) revert();
    _;
  }

  /// called by the owner on emergency, triggers stopped state
  function halt() external onlyOwner {
    halted = true;
  }

  /// called by the owner on end of emergency, returns to normal state
  function unhalt() external onlyOwner onlyInEmergency {
    halted = false;
  }
}
