// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
Restricted Access to a Contract is a common practice.

By Default, a contract state is read-only unless it is specified as public.

We can restrict who can modify the contract state or call a contract functions using modifiers.

Let us build a contract with modified restricted access with following common writeouts:

     onlyBy- only the mentioned caller can call this function.

     onlyAfter - called after certain time period

     costs - call this function only if certain value is provided.

*/

contract RestrictedAccess
{
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    //write a modifier onlyBy that will require the current caller to be equal to 
    //an account address which we set as an input in modifier and if 
    //the requirement fails send a message that says - sender not authorized

    modifier onlyBy(address _account)
    {
        require(msg.sender == _account, 'sender not authorized');
        _;
    } 
    
    modifier onlyAfter(uint _time) 
    {
        require(block.timestamp>= _time, 'function is called too early!');
        _;
    }

    modifier cost(uint _amount)
    {
        require(msg.value>=_amount,'Not enough Ether provided!!');
        _;
    }
    
    //write the function that can change owner address


    function chnageOwnerAddress(address newAddress) onlyBy(owner) public 
    {
        owner = newAddress;
    }

    //write a function that can disown current owner
    //only run the function 3 weeks after the creation of the contract
    //the requirement fails send a message that says - sender not authorized

    function disown() onlyBy(owner) onlyAfter(creationTime+5 seconds) public  
    {
        delete owner;
    }

    /*
    Exercise:
    1.create a modifier called cost with takes an amount
    2.require that msg.value is grater than or equal to the amount
    3.if the msg.value is not greater than or equal to the amount return a string that says 
      not enough ether provided
    4.Write a function called ForceOwnerChange which takes an address called _newOwner and is payable
    5.add a modification to the signature so that the function needs 200 ether to execute
    6.set the owner of the contract to the new owner of the address.
    7.BONUS******figure out how the function actually run!!!!  
    */

    function ForceOwnerChange(address _newOwner) payable public cost(200 ether) 
    {
        owner = _newOwner;
    }
}