// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
/*
ERROR HANDLING:


solidity has function that help with error handling
A way of tackling this is that when error happens, the state rverts back to its original state.
Below are some of the important methods for error handling:

    assert(bool condition)- In case condition is not met, this method call causes an invalid
    opcode and any changes done to state got reverted.This method is to be used for internal errors.
    
    require(bool condition)- In case condition is not met, this method call reverts to 
    original state. -This method is to be used for errors in input or external components

    require(bool condition, string memory message)- In case condition is not met,this method
    call reverts to original state. -This method is to be used for errors in input or 
    external components.It provides an option to provide a custom meaasge.


    revert()- This method aborts the execution and revert any changes done to state.

    revert(string memory reason)- This method aborts the execution and revert any changes 
    done to the state. It provides an option to provide a custom message.

*/

contract LearnErrorHandling
{
   bool public sunny = true;
   bool public umbrella = false;
   uint finalCalc = 0;

   //solar panel machine
   function solarCalc() public
   {
       require(sunny,"it is not sunny today");  //require
       finalCalc +=3;
       assert(finalCalc != 6);
           
       
   }
   //final calc can never equal 6

   function internalTestUnits() public
   {
       assert(finalCalc != 6);
   }

   //machine that controls the weather

   function weatherChanger() public
   {
       sunny = !sunny;
   }

   //grab final calc

   function getCalc() public view returns(uint)
   {
      return finalCalc;
   }
   
   function bringUmbrella() public
   {   
       if(!sunny)
       {
           umbrella=true;  //revert
       }else{
       revert('No need to bring umbrella today');
       }
   }
}