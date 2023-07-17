// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
Solidity provides an option to use assembly language to write inline assembly within 
solidity source code

Assembly is a low level language that allows you to directly manipulate the EVM(more dangerous and not recomended)

EVM smart contract are not the real code in blockchain - solidity code is compiled to a lower level language
 
*/

contract LearnAssembly
{
    function addToEVM() external
    {
        uint x;
        uint y;
       // uint z = x+y;

        //all of these is compiled to low level instruction known as opcodes-intotal there is around 100

    //how do we use assembly??

      assembly
      {
        //declare an assembly block
        //inside we can manipulate variable declared outside
        //no semicolon , = is actually := and we can bring in opcodes
         
          let z := add(x,y)

          //if function for

          //load data for a specefic slot

          //let a := mload(0x40)

          //store something temporarily to memory

          //mstore(a,4)

          //persistance storage!
          //sstore(a,100) 
      }
      //in EVM everything is stored in slots of 256 bits(a uint occupies one slot) whereas 
      //mapping or array is several
    }
      //function addToEVM2() public view returns(bool success)
      function addToEVM2() public view returns(bool)
      {
        uint size;
        address addr;

        //check whether an address contain any  bytes of code or not
        assembly
        {
               size := extcodesize(addr)
        }
        if(size>0){return true;}else{return false;}
      }
    
    
    
}