// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
Exercise:

1.create a contract called Vendor with a state variable address seller
  It should contain a modifier onlySeller that requires the msg.sender to be seller.
2.Add a dunction becomeSeller which sets sellern to the msg.sender.
3.create a function named sell which is payable and check so see if an input of an amount 
  is greater than msg.value 
  to revert that there is not enough ether provided as an throw error   
*/

contract Vendor
{   
    address seller;
    modifier onlySeller()
    {
        require(seller == msg.sender, "only seller can sell this");
       _;
    }

    function becomeSeller() public
    {
        seller = msg.sender;
    }

    function sell(uint amount) public payable onlySeller
    {
        if(amount>msg.value){revert("Not Enough Ether Provided");}
    }
}