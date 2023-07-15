// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
    ********Inheritance

    Inheritance is a way to extend functionalityof a contract
    Solidity supports both single as well as multiple inheritance.Following are the key highlight

    Observe : the contract in solidity is similar to a class in c++ -a blueprint for an object

    classes can inherit and so can contracts!!

    constructor - A special function declared with constructor keyword which will be executed
    once per contract and is invoked when contract is created
*/
/*
  Exercise:Create two contracts A and B
  1.contract A should have state variable called innerVal initialized to 100.
  2.create a fully accessible function called innerAddTen which returns 10 to any given input
  3.contract B should inherit from contract A
  4.Contract B should have a function called outerAddTen which returns the calculation from
    innerAddTen function in Contract A to any given input
  5.create a function in contract B which returns the value of innerVal from Contract A 
  6.compile and sucessfully deploy the contract and test the result

*/

contract A
{
    uint innerval=100;

    function innerAddTen(uint a) public view returns(uint)
    {
        return  (a + 10);
    }
}

contract B is A
{
     function outerAddTen(uint val) public view returns(uint)
     {
         return innerAddTen(val);
     }

     function getInnerVal() public view returns(uint)
     {
         return innerval;
     }
}