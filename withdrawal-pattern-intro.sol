// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
CyberSecurity In Solidity - against  bad actors , accidential occurance

withdrawal pattern ensures that direct transfer call is not made which poses a security threat.
transfer are atomic(meaning all or nothing)

write an iterating function called returnFunds that will refund through the transfer method investors to a var
called funders back to their wallets called contributedAmount. Add modifier to the signature 
that only the owner can execute this function. The function should return a bool success.


contract test
{   
    modifier onlyOwner{
        require(true);
        _;
    }
    function returnFunds() public onlyOwner returns(bool sucess)
    {
        for(uint i =0;i<funders.length;i++)
        {
            funders[i].transfer(contributedAmount);
        }
        return true;
    }


/*
what do you thinkn is the problem with returnFunds function??

1.what if owner chickens out and does not return funds??
the owner is a single point of failure and this pattern 
suggests adherence to server-centric thinking-
only a privileged user should be able to initiate a mass distribution of funds.

2.the loop is ubound! it could very well run out of gas before allocating all the funds back
  an attacker could do is just to make a bunch of small contributions.00000284289

  another example:- We only have two investors to refund -

  write a function that will return funds to two investors, john and tatianna without using a 
  forloop


function returnFundss() public onlyOwner returns(bool success)
{
   tatiana.transfer(contributedAmount);
   john.transfer(contributedAmount);
   return true;
}


/*what could go wrong
what if tatiana rejects the transfer? if tatiana rejects the transfer the function 
is going to fail and then john will not get paid!!!

thinking that all contract and accounts want to accept funds automatically may be
intuitive at first but it is in fact very naive and dangerous to build our code like this

if it is more in their interest to reject funds then chances are they will reject the funds

write a fall back function

fallback () public
{
  //a default fallback function is not payable - it will reject funds

  //if one contract has a default fallback function it would be deadly for the naive contract
  //to refund this contract address - it will not work unless everyone accepts. It will fail

  //disallow contract to receive funds

  //should we disallow contract to receive fund??(no )
  //beacuse not all contract will fail or mailcious - it would deter DAOs

  //how does a contract finds out if another address is contract?
}
} */

contract Victim
{
    function isItAContract() public view returns(bool)
    {
        //if there are bytes of code greater than zero then it is a contract!
        uint32 size;
        address a = msg.sender;
        //inline assembly accesses EVM (Ethereum Virtual Machine) at a low level
        assembly{
            //ectcodesize retrives the size of code
            size := extcodesize(a)
        }
        return(size>0);
    }
}

contract attacker
{
    bool public trickedYou;
    Victim victim;
    constructor(address _v) public {
        victim=Victim(_v);
        trickedYou = !victim.isItAContract();
    }
}

//well if you call the address from the constructor there are no bytes codes

//What do we do?? The withdrawal Pattern