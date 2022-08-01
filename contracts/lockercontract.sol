//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
 contract locker
 {
     uint256 amount;
     address owner;
     address payable senders_address;
  constructor()
  {
      owner=msg.sender;
  }   
    receive() payable external{
        senders_address=payable(msg.sender);

    }
    function Bankbalance()public view returns(uint)
    {
        
        uint256 bal=address(this).balance/1 ether;
        return bal;
    }
    
    function withdraw_money(uint256 ether_withdrawn)public payable returns(string memory)
    {
        string memory value;
        amount=address(this).balance/1 ether;
        if (ether_withdrawn==amount)
        {
            value="cannot withdraw in a single go";
        }
        else if(ether_withdrawn<amount)
        {
            payable(owner).transfer(ether_withdrawn);
            amount=amount-ether_withdrawn;
            
        }
        else if(ether_withdrawn>amount)
        {
            value="insufficent funds";
        }
        return value;      
           
    }
 }