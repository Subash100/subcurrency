// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
Exercise Interface with Uniswap(Decentralized Exchange)
In Uniswap smart contract, or pair, manages a liquidity pool made up of reserves of two ERC-20 tokens!
In this exercise you are going to use the IDE to speak to Uniswap and get the reserves of a uniswap pair of 
your choosing

These are instruction in order to complete this exercise
1.create two interfaces which each hold seperate function signatures which you must look up
  in solidity docs V2
2.One interface will be called UniswapV2Factory which will contain the function signature
  that gets pairs.
3.Another interface will be called UniswapV2Pair which will contain the function signature
  to get reserve value.
4.create a contract which contains addresses of paired tokens you choose as well as the
  factory address
5.within the contract make a function which can successfully get the pair of your tokens 
  and set it to single address.      
6.use that address to get the reserve values and finally return the reserve values
7.switch to mainnet and connect MetaMask but Do Not deploy the contract(or you will spend money)
8.From the mainnet manually go through the steps of retriving the values without deploying 
  or spending gas!
9.Post your results of the reserve value in discord community and celebrate because ou have seriously
  earned it.
10.GOOD LUCK!         
*/

interface UniswapV2Factory
{
    function getPair(address tokenA, address tokenB) external view returns (address pair);

}

interface UniswapV2Pair
{
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract MyContract
{
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai=0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth=0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getReserveToken() external view returns(uint,uint)
    {
        address pair=UniswapV2Factory(factory).getPair(dai,weth);
        (uint reserve0,uint reserve1,)=UniswapV2Pair(pair).getReserves();
        return (reserve0,reserve1);
    }
}