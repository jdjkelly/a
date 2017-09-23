pragma solidity ^0.4.13

// https://theethereum.wiki/w/index.php/ERC20_Token_Standard
contract BeardCoin {
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
  mapping (address => uint256) public balanceOf;
  string public constant name = "BeardCoin";
  string public constant symbol = "BRD";
  uint8 public constant decimals = 10;
  uint256 public constant totalSupply = 9999999999;

  function BeardCoin(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 decimalUnits)
  {
    balanceOf[msg.sender] = initialSupply;
    name = tokenName;
    symbol = tokenSymbol;
    decimals = decimalUnits;
  }

  function totalSupply() constant returns (uint totalSupply);
  function balanceOf(address _owner) constant returns (uint balance);
  function transfer(address _to, uint _value) returns (bool success);
  function transferFrom(address _from, address _to, uint _value) returns (bool success);
  function approve(address _spender, uint _value) returns (bool success);
  function allowance(address _owner, address _spender) constant returns (uint remaining);

  function transfer(address _to, uint256 _value) {
    require(balanceOf[msg.sender] >= _value);
    require(balanceOf[msg.sender] + _value >= balanceOf[_to]);
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    Transfer(msg.sender, _to, _value);
  }
}
