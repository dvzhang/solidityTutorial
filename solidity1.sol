pragma solidity ^0.4.0;

import "solidity_for_import.sol";

contract Test{
    uint a;

    // bool
    bool boola = true;
    bool boolb = false;
    function testbool(boola) public returns (bool) {
        return !boola;
    }

    //int and operation
    int256 b = 20;
    int256 c = 30;
    function testadd() public view returns (int) {
        if (b>c){
            return b + c;
        } else if ( b == c ){
            return b * c;
        } else {
            return b << 2;
        }
        // -1 >> 2;
    }

    // literals
    function testLiterals() public view returns(int){
        return 1.0 + 1.5e10;
    }

    function testStringLiterals() public view returns(string memory) {
        return "abc";
    }

    function testHexLiterals() public view returns(bytes2, bytes1, bytes1){
        bytes2 a = hex"abcd";
        return (a, a[0], a[1]);
    }

    // Address Literal
    function deposit() public payable {

    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    function transferEther(address payable towho) public {
        towho.transfer(10);
    }

    // array
    uint[] public u = [1,2,3];
    string s = "abcdefg";

    function h() public view returns (uint) {
        return bytes(s).length;
    }

    function f() public view returns (byte) {
        return bytes(s)[1];
    }

    function newM(uint len) public view returns (uint){
        uint[] memory a = new uint[] (len);
        bytes memory b = new bytes(len);
        // a[6] = 8;
        g([uint(1), 2, 3]);
        return a.length;
    }
    function g(uint[3] memory _data) public view {
    }

    // struct
    struct Funder {
        address addr;
        uint amount;
    }
    Funder public funder;
    function newFunder() public {
        funder = Funder({addr: msg.sender, amount: 10});
    }

    // mapping
    mapping(address => uint) public balances;
    function updateBalance(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }

    // varible
    constructor() payable{
    }
    function testApi1() public view returns (address){
        return msg.sender;
    }
    function testApi2() public payable returns (uint256){
        return msg.value;
        // return block.coinbase;
        // return block.difficulty;
        // return block.number;
        // return block.timestamp;
        // return now;
        // return tx.gasprice;
    }



    function setA(uint x) public{
        a = x;
        emit Set_A(a );
    }

    event Set_A(uint a);

    struct Pos {
        int lat;
        int lng;
    }

    address public ownerAddr;

    modifier owner (){
        require((msg.sender == ownerAddr));
        _;
    }

    function mine() owner {
        a += 1;
    }
}