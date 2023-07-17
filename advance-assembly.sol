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
    
    /*
    EXERCISE:

    the function addToEVM3 is attempting to convert data bytes
    It wants to convert using solidity a data byte into a fixed bytes size
    however if you run the code way it is then it will not compile sucessfully because
    explicitily type conversions are not allowed from bytes memory to bytes32

    use assembly and mload to convet the data to bytes32 successfully. Hint: Bytes in memory
    size starts at second slot so we need to bring in the add 32 to start at correct position.
    */
    
    function addToEVM3() external view
    {
        
        bytes memory data = new bytes(10);

        //we cannot convert this into in a fixed size
             //bytes32 dataB32= bytes32(data);


        // but if we only care about the first 32 bytes we can use assembly! :)
         bytes32 dataB32;
        assembly
        {
            //bytes in memory is size so data actually starts at second slot
            dataB32:=mload(add(data,32))
            //operation add and we add 32bytes so we fill the first slot
        }
    }
}