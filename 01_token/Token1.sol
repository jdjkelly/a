pragma solidity ^0.4.16;

contract MoustacheCoin {
  mapping (address => uint256) public balanceOf;

  function MoustacheCoin(
    uint256 initialSupply
  ) {
    balanceOf[msg.sender] = initialSupply;
  }

  function transfer(address _to, uint256 _value) {
    require(balanceOf[msg.sender] >= _value);
    require(balanceOf[msg.sender] + _value >= balanceOf[_to]);
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
  }
}
