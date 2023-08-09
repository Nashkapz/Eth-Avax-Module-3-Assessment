// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;



contract Token {

    // public variables here
    string public tokenName = "Kapzeum";
    string public abbrv = "KPZ";
    uint public totalSupply = 0;
    
    
    // mapping variable here
    mapping (address=> uint) public balances;

    address private owner;

    constructor(){
        owner = msg.sender;
    }

    // mint function
    function mint(address _address, uint _value) public {
        require(msg.sender == owner, "Only owner is allowed to mint tokens.");
        totalSupply += _value;
        balances[_address] += _value;  

    }


    // burn function
    function burn( address _address,uint _value) public {
        require( balances[_address] >= _value, "You don't have enough tokens to burn.")
        totalSupply -= _value;
        balances[_address] -= _value;

    }

    // transfer function
    function transfer( address _address,uint _value) public {
        require( balances[msg.sender] >= _value, "You don't have enough tokens to transfer.")
        balances[_address] += _value;
        balances[msg.sender] -= _value;

    }

}
