pragma solidity ^0.8.23;

contract bank {
    mapping (address => uint) public balance;
    address[3] public riches;
    address owner;

    constructor () {
        owner = msg.sender;
    }

    receive() external payable { }
    // 存款
    function save() public payable  {
        balance[msg.sender] = msg.value;
        uint minBalance = msg.value;
        uint index = 4;
        // 循环判断最小
        for(uint i = 0; i < 3; i++){
            if (riches[i] == msg.sender) {
                return;
            }
            if(minBalance > balance[riches[i]]){
                minBalance = balance[riches[i]];
                index = i;
            }
        }
        if(index < 3){
            riches[index] = msg.sender;
        }
    }

    // 提款，只有管理员可以提取
    function withdraw() public {
        require(msg.sender == owner, "Operation without permission!");
        // ba.transfer(ba.balance);
        uint256 amount = address(this).balance;
        //谁要钱谁发起，发起的会调用实例this，指的是合约
        payable(msg.sender).transfer(amount);
    }
}