// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
Libraries are similar to contracts but are mainly intended for reuse. A library contains functions
which other contract can call.

solidity have certain restrictions on use of library. Following are the key characteristics of 
solidity library.
      
      Library functions can be called directly if they do not modify the state.
      that means pure or view functions can only be called from outside from library

      Library cannot be destroyed as it is assumed to be stateless

      A library cannot have state variables.

      A library cannot inherit any element.

      A library cannot be inherited  
      
      (//storing of functional data)
*/


library Search
{   
    //we want this loop to return the index value of some integer we are searching for
    function indexOf(uint[] storage self , uint value) public view returns(uint)
    {
        for(uint i=0;i<self.length;i++)
        {
            if(self[i]==value) return i;
        }
    }
}

contract test
{
    uint[] data;
    constructor() public
    {
        data=[1,2,3,4,5]; //or use data.push(1)..data.push(2)..etc
    }

    function isValuePresent(uint val) external view returns(uint)
    {
        uint value=val;
       uint index = Search.indexOf(data,value);
       return index;
    }
}

/*
the directive using A for B; can be used to attach library functions of library A to a given 
type B
These functions will used the caller type as their parameter(identified using self).

Exercise: using search2 library below,set it for an empty array and access the data accordingly
to run the search functionality.

*/