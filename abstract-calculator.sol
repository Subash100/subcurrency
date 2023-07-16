// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
Exercise:
1.create an abstract base contract called calculator with read only public function the 
  returns integers
2.create a derived contract called  Test which derives the calculator contract and can calculate 
  1+2 and return result  
*/

contract calculator
{
    function sum() public pure virtual returns(uint){}
}

contract Test is calculator
{
    function sum() public pure override returns(uint)
    {
        return 1+2;
    }
}