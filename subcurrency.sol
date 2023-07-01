// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

//the contract allows only its creator to create new coins(different issuance schemes are possible).
//Anyone can send coins to each other without a nedd for regestering with a username and password,
//all you need is an Ethereum keypair.

contract coin
{
    // the keywor public its making variables
    //here accessible from other contracts
     address public minter;
     mapping(address=>uint) public balances;

    event sent(address from, address to ,uint amount);

    //constructor only runs when we deploy contract
     constructor()
     {
         minter=msg.sender;
     }
    //we want to make new coin and send them to an address
    //only owner can send these coins
     function mint(address receiver,uint amount) public
     {
       require(msg.sender==minter);
       balances[receiver]=balances[receiver]+amount;  //balances[receiver]+=amount
     }

     //send any amount of coin 
     //to an existing address

     error insufficientBalance(uint requested, uint available);

     function send(address receiver , uint amount) public
     {  //require amount to be greater 
         if(amount>balances[msg.sender])
         revert insufficientBalance({
             requested:amount,
             available:balances[msg.sender]
         });
         balances[msg.sender]-=amount;
         balances[receiver]+=amount;
     }
}