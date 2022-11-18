pragma solidity ^0.8.17;

contract Counter{
    uint num;
    constructor (){
        num = 0;
    }
    function increment() public{
        num += 1;
    }

    function getNum()public view returns (uint){
        return num;
    }
}