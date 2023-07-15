// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
/*
Event Example:

Abstraction- Decentralized Exchange : on a smart contract traders can trade tokens
        -from the smart contract emit an event so they can get the data (web front mobile)

After emmiting events you can't read them in the past only for entities outside  of the blockchain
- not stored as memory

events have lower gas cost than storage
*/


contract LearnEvents
{
     //1.declare event
     //2.emmit event
     //use camelcase
     // indexed -cost higher gas- can only use 3 index fro event - allows outer consumer to filter
     //through and filter and get the informatiion they need

     event NewTrade(
         uint indexed date,
         address from,
         address indexed to,
         uint indexed amount
     );
    
    function trade(address to,uint amount) external
    {  //outside consumer can see the event through web3.js
       // block.timestamp is a global variable that gives the current timestamp
       emit NewTrade(block.timestamp,msg.sender,to,amount);
    }

}