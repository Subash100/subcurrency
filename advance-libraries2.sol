// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;




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
    //using A (library) for B (another element)
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

Exercise: 
1.copy over the library search and the contract test below,
  and rename library search to search2 and contract test to test 2

2.using the A for B library pattern assign the new library to an empty array type and 
  rewrite the code so that we can run the same search hardcoded this time to the value of 4
  accordingly. 

*/


library Search2
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

contract test2
{   
    //using A (library) for B (another element)

    using Search2 for uint[];
    uint[] data;
    constructor() public
    {
        data=[1,2,3,4,5]; //or use data.push(1)..data.push(2)..etc
    }

    function isValuePresent() external view returns(uint)
    {
        uint value=4;
       uint index = data.indexOf(value);
       return index;
    }
}