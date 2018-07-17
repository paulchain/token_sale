pragma solidity ^0.4.24;

contract DappToken {
	// Name
	// Symbol
	string public name = "Dapp Token";
	string public symbol = "DAPP";
	string public standard = "Dapp Token v1.0";
	uint256 public totalSupply;

	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value
	);

	event Approval(
		address indexed _owner,
		address indexed _spender,
		uint256 indexed _value
	);

	// transfer

	mapping(address => uint256) public balanceOf;
	mapping(address => mapping(address => uint256)) public allowance;
	// allowance


	constructor  (uint256 _initialSupply) public {
		balanceOf[msg.sender] = _initialSupply;
		totalSupply = _initialSupply;	
	}

	// Transfer 


	function transfer(address _to, uint256 _value) public returns (bool success) {
		// Exception if the account doesn't have enough
		require(balanceOf[msg.sender] >= _value);
		// Transfer balance
		// Return boolean
		// Transfer event	
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;	

		Transfer(msg.sender, _to, _value);

		return true;
	}

	// approve 

	function approve(address _spender, uint256 _value) public returns (bool success) {
		// Allowance 
		allowance[msg.sender][_spender] = _value;

		// Approve event	
		Approval(msg.sender, _spender, _value);

		return true;
	}

	// transfer from 

	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {

		require(_value <= balanceOf[_from]);
		require(_value <= allowance[_from][msg.sender]);
		// Require allowance is big enough
		balanceOf[_from] -= _value;
		balanceOf[_to] += _value;
		
		allowance[_from][msg.sender] -= _value;

		Transfer(_from, _to, _value);
		return true;
	}












}