// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
INTERFACES

Interfaces are similar to abstract contracts and are created using interface keyword
Following are the key characterstics of an interface.
     
      Interface cannot have any function with implementation.

      Functions of an interface can be only of type external.

      Interface cannot have constructor

      Interface cannot have state variables

      Interface can have enum, structs which can be accessed using interface name dot notation
*/

 
contract Counter
{
    uint public count;

    function increment() external
    {
        count +=1;
    }
}
//how do we interact with this contract without copy and pasting code??
//ANSWER - Interfaces

interface ICounter
{
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract
{
    function incrementCounter(address _counter) external
    {
        ICounter(_counter).increment();
    }

    function getcont(address _counter) external view returns(uint)
    {
        return ICounter(_counter).count();
    }
}