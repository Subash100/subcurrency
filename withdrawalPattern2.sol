// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
    The Withdrawal Pattern

    Instead of using transfer which reverts the code we can use send which returns a bool

    write a function so only owner can send tatianna funds with the send method with logic 
    to set up what happens if the amount is not sent to tatianna. 
*/
contract SendMethod{
  /*  function sendRefund() public onlyOwner returns(bool success)
    {
       if(!tatiana.send(amount))
       {
           //do something with failure
       }
    }
    //this can still get messy for accounting...
    */


/*
write a withdrawal function so that the investor can withdraw fund on their own through 
that functionality.Let them do it themselves!!

Enter our best friend over here - msg.sender
*/

/*
write another function to claim refunds. write a function called claimRefund which requires 
that the balance of msg.sender greater than zero and transfer the balance to the current caller.
pseudo balance var name balance
*/

function claimRefund() public
{
    require(balance[msg.sender]>0);
    msg.sender.transfer(balance[msg.sender]);
}

//by the coustmer working directly to claim a refund with their contract address we eliminate 
//the outside interference veryy greatly!!!

//key takeaway--->BY MAKING OUR TRANSACTION ONE AT A TIME we greatly reduce danger to our execution.-withdrawl patterns


//exercise
/*it is not safe to interact with more than one customer at a time so write a function to return 
funds using withdrawal pattern.

1.write a function called withdrawFunds that takes an amount and returns bool success in the signature.
2.Require that the balance of the current caller is greater than or equal to the amount
3.subtract the amount from the balance of the current sender
4.transfer the amount over and return the trueness of the function
*/
  function withdrawFunds(uint amount) public returns(bool success)
  {
      require(balance[msg.sender]>=amount);  //guard upfront
      balance[msg.sender]=balance[msg.sender]-amount; //optimistic accounting
      msg.sender.transfer(amount); //transfer
      return true;
  }
}