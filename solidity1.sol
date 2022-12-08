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

    // assert & require
    function sendHalf(address payable addr) public payable returns (uint balance){
        require(msg.value % 2 == 0);
        uint balanceBeforeTransfer = address(this).balance;
        addr.transfer(msg.value / 2);
        assert(address(this).balance == balanceBeforeTransfer - msg.value / 2);
        return address(this).balance;
    }

    // Function
    function simpleInput(uint a, uint b) public view returns (uint sum){
        sum = a + b;
    }
    function testSimpleInput() public view returns (uint sum) {
        sum = simpleInput({a:1, b:2});
    }
    function testSimpleInput2() public view returns (uint sum) {
        sum = simpleInput(1, 2);
    }
    function simpleInput2(uint a,  uint b) 
        public view returns (uint sum, uint mul){
        sum = a + b;
        mul = a * b;
    }
    function testSimpleInput3() public view returns (uint sum, uint mul) {
        (sum, mul)  = simpleInput2(1, 2);
    }

    // control stream
    function testWhile() public view returns(uint , uint ) {
        uint i = 0;
        uint sumOfOdd = 0;
        uint sumOfEven = 0;
        while (true) {
            i ++;
            if (i % 2 == 0){
                sumOfEven += i;
            } else {
                sumOfOdd += i;
            }
            if (i > 10){
                break;
            }
        }
        sumOfOdd = sumOfOdd > 20 ? sumOfOdd + 10 : 0;
        return (sumOfOdd, sumOfEven);
    }

    

    // scope
    uint public data;
    function testscope(uint a) private view returns(uint) {
        return a + 1;
    }
    function setData(uint a) internal {
        data = a;
    }
    function testSetData(uint a) external {
        data = a;
    }
    function testSetData2() public {
        setData(1);
        // this.exSetData(1); 
    }

    // function
    constructor(uint a) public{
        data = a;
    }
    event EVENTA(uint a);
    function testscope(uint a) public view returns(uint) {
        return a + 1;
    }
    function f() public pure returns(uint) {
        // return 1 * 2 + data;
        return 1 * 2;
    }
    function fallback() public payable {}
}


contract Caller {
    function callTest(Test test) public {
        address(test).send(1 ether);
    }
}

contract D {
    uint public a;

    function readData() public{
        Test test = new Test();
        // test.setData(1);
        test.testSetData(2);
        // test.testSetData2();
        a = test.data();
    }
}

contract Test2 is Test {
    function setData3(uint a) internal {
        data = a;
    }
}

