// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
It is time to test your skills and the knowledge you have gained going through this course from start to finish!

Final Exercise: Create an Auction DApplication(The Decntralized Ebay)

1.You must create a contract called auction which contains state variable to keep track of
  the beneficiary(auctioneer),the highest bidder,  the auction end time ,and the higest bid.

2.There must be events set up which can emit whenever the highest bid changes both address and 
  amount and an event for auction ending emitting the winner address and amount.

3.The contract must be deployed set to the beneficiary address and how long the auction will run for.

4.There should be a bid function which includes at the minimum the following.
  a.revert the call if the bidding period is over
  b.If the bid is not higher, send the money back.
  c.emit the highest bid has increased

5.Bearing in mind the withdrawal pattern, there should be a withdrawal function to return bids
  based on the library of keys and values.

6.There should be a function which ends the auction and sends the highest bid to the beneficiary.

*/

contract Auction
{
    address payable public beneficiary;
    uint public auctionEndTime;

    //current state of auction
    address public highestBidder;
    uint public highestBid;
    bool ended;

    mapping(address => uint) pendingReturns;

    event highestBidIncreased(address bidder, uint amount);
    event auctionEnded(address winner , uint amount);

    constructor(uint _biddingTime, address payable _beneficiary)
    {
        beneficiary = _beneficiary;
        auctionEndTime= block.timestamp+ _biddingTime;

    }
    
    function bid() public payable
    {
        if(block.timestamp>auctionEndTime)
        {
          revert('auction time ended');
        }

        if(msg.value<=highestBid)
        {
            revert("sorry,the bid is not high enough");
        }

        if(highestBid !=0)
        {
            pendingReturns[highestBidder] += highestBid;
        }
        
        highestBidder = msg.sender;
        highestBid= msg.value;
        emit highestBidIncreased(msg.sender,msg.value);

        
    }

    //withdraw bids that were overbid

    function withdraw() public payable returns(bool)
        {
            uint amount = pendingReturns[msg.sender];
            if(amount>0)
            {
                pendingReturns[msg.sender]=0;
            }

            if(!payable(msg.sender).send(amount))
            {
                pendingReturns[msg.sender] =  amount;
            }
            return true;
        }

        function auctionEnd() public 
        {   
            if(block.timestamp<auctionEndTime) revert("the auction has not ended yey");
            if(ended) revert("the auction is already over");
             ended=true;
             emit auctionEnded(highestBidder,highestBid);
             beneficiary.transfer(highestBid);
        }

    
}