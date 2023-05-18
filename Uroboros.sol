pragma ton-solidity >=0.66.0;
pragma AbiHeader time;
pragma AbiHeader pubkey;
pragma AbiHeader expire;

contract Uroboros {
    address static ownerAddress;
    uint256 static nonce;
    string message;
    uint16 constant NOT_MY_OWNER = 100;

    modifier onlyOwner {
        require(msg.isInternal && ownerAddress == msg.sender && ownerAddress != address.makeAddrStd(0, 0), NOT_MY_OWNER);
        tvm.accept();
        _;
    }

    function orderToEat(string newMessage) external {
        message = newMessage;
        Uroboros(address(this)).eat{value: 0.002 ever, flag: 1}();
    }

    function eat() external pure {
        tvm.accept();
        repeat(255) {
            Uroboros(address(this)).eat{value: 0.002 ever, flag: 1}();
        }
    }

    function withdraw() external view onlyOwner {
        ownerAddress.transfer(0, false, 128);
    }

    function destroy() external onlyOwner {
        selfdestruct(ownerAddress);
    }

    function getMessage() external view returns (string) {
        return message;
    }
}
