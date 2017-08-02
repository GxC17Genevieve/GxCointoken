pragma solidity ^0.4.4;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() {
    owner = msg.sender;
  }


    // @notice called to mark contributer when tokens are transfered to them after ICO
    // @param _backer {address} address of beneficiary
    function process(address _backer) onlyBy(owner) returns (bool){

        Backer storage backer = backers[_backer]; 
        backer.processed = true;

        return true;
    }

    
    // {fallback function}
    // @notice It will call internal function which handels allocation of Ether and calculates PPP tokens.
    function () payable {
        if (block.number > endBlock) revert();
        handleETH(msg.sender);
}


  function setCompleted(uint completed) restricted {
    last_completed_migration = completed;
  }

  
}
