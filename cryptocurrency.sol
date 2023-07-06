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

     //events allow clients to react to specefic 
     //contract changes you declare 

     /*Event is inheritable member of contract .An event is emitted, it stores the argument
       passed in transaction logs.These logs are stored on blockchain and are accessible using
       address of the contract till the contract is present in blockchain.
     */

    event sent(address from, address to ,uint amount);

    //constructor only runs when we deploy contract
     constructor()
     {
         minter=msg.sender;
     }
    //we want to make new coin and send them to an address
    //only owner can send these coins

    //sends an amount of newely created coins to an address 
    //can only be called by contract creator
     function mint(address receiver,uint amount) public
     {
       require(msg.sender==minter);
       balances[receiver]=balances[receiver]+amount;  //balances[receiver]+=amount
     }

     

     //errors allows you to provide information about
     //why an operation failed.They are returned to caller of the function

     error insufficientBalance(uint requested, uint available);

     //send any amount of coin from any caller 
     //to an  address

     function send(address receiver , uint amount) public
     {  //require amount to be greater 
         if(amount>balances[msg.sender])
         revert insufficientBalance({
             requested:amount,
             available:balances[msg.sender]
         });
         balances[msg.sender]-=amount;
         balances[receiver]+=amount;
         emit sent(msg.sender,receiver,amount);
     }
}