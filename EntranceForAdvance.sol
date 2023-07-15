// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
EXERCISE: The GATEWAY Exrecise:

1.Create 3 contracts C,D,E
2.  Do the following in contarct C:
    a.create an integer state variable called data which can only be used internally and not 
      all in any other contract.
    b.create an integer state variable called info which can be called both inside and outside
      the contract
    c.immediately initialize info's value to 10 within a constructor
    d.Create a function called increment which can only be used internally and not at all in any other contracts
      It should take an input integer called a and be read only returning the calculation of its input +1
    e.write a function called updateData which takes an integer argument called a and sets data to argument.
      The function should be able to be called both inside and outside the contract
    f.write a read only function called getData which returns value of the data and can be called both inside and outside
    g.write a read only function called compute which calculates and returns two integer arguments a+b.
      The function should can only be used internally or by derived contracts

    Do the following in contract D:
    a.derived contract C to a new variable c and set a new instance of the contract to it
    b.write a read only function called readInfo which returns the info from contract C
      which can be called both inside and outside the contract.

    Do the following in contract E:
    a.Inherit contract C into E with special keyword is
    b.create an interger called result which can only be used internally and not even by derived contracts.
    c.create a private variable c which inherits the contract C
    d.immediately set the variable c to a new instance of the contract C upon deployment with a constructor
    e.write a function called getComputedResult which sets the values of 23 and 5 to the compute function in contract C to the var result
      the function can be used both externally and internally.
    f.create a public read only function called getResult which returns the var result.
    g.create a read only function which returns the info variable from contract C and set the function 
      to be used both externally and internally.

    h. Celerabate completing this dang long exercise because you deserve  
*/

contract C
{
   uint private data;
   uint public info;

   constructor ()
   {
       info=10;
   }

   function increment(uint a) private pure returns(uint) { return a+1; }

   function updateData(uint a) public { data=a; }

   function getData() public view returns(uint) { return data; }

   function compute(uint a, uint b) internal  pure returns(uint){return a+b;}

}

contract D
{
  C c= new C();

  function readInfo() public view returns(uint)
  {
    return c.info();
    //return c.getData();

  }
}

contract E is C
{
   uint private result;
   C private c;

  constructor()
  {
    c = new C();
  }

  function getComputedResult() public
  {
    result = compute(23,5);
  }
  
  function getResult() public view returns(uint)
  {
    return result;
  }

  function newInfo() public view returns(uint)
  {
    return info; //or c.info()
  }
}