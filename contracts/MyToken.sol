// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;



contract Token {

    // public variables here
    string public tokenName = "Kapzeum";
    string public abbrv = "KPZ";
    uint public totalSupply = 0;
    

    // mapping variable here
    mapping (address=> uint) public balances;

    // mint function
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;  

    }


    // burn function
    function burn( address _address,uint _value) public {
        if( balances[_address] >= _value){
            totalSupply -= _value;
            balances[_address] -= _value;
        }
        
    }

    // transfer function
    function transfer( address _address,uint _value) public {
        if( balances[msg.sender] >= _value){
            balances[_address] += _value;
            balances[msg.sender] -= _value;
        }
        
    }

}
