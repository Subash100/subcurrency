// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
ABSTRACT CONTRACTS

Abstract Contract is one which contains at leat one function without any implementation.
such a contract is used as a base contract.
Generally an abstract contain both implemented as well as abstract functions.
Derived contract will implement the abstract function and use the existing functions
as and when required.

//base contract

//derived contract
*/
//base contract
contract X
{   //since function has no implementation we should mark it as virtual
    function y() public view virtual returns(string memory){}
}

//derived contract

contract Z is X
{
    function y() public override view returns(string memory)
    {
        return 'hello';
    }
}


//technically contract is still abstract since it has at least one function without body
//base contract
contract Member
{
    string name;
    uint age = 38;
    
    
       //beacuse function setname has no body the contract is abstract
    function setName() public virtual returns(string memory){}

    function returnAge() public view returns(uint)
    {
        return age;
    }
}

//derived contract
contract Teacher is Member
{
    function setName() public view override returns(string memory)
    {
        return 'gordan';
    }
}

/*
if non implemented function doesnot use curly bracket use abstract in front of contract name
then contract will not be deployed but can be inherited
*/