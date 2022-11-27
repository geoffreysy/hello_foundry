// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";

contract Helper is Test {
    address payable[] public testGlobalUsers;

    uint private constant NUM_USERS = 10;
    bytes32 private nextUser = keccak256(abi.encodePacked("user address"));

    constructor() {
        testGlobalUsers = _createUsers(NUM_USERS);
    }

    // create users with 100 ETH balance each
    function _createUsers(uint256 userNum)
        internal
        returns (address payable[] memory)
    {
        address payable[] memory users = new address payable[](userNum);
        for (uint256 i = 0; i < userNum; i++) {
            address payable user = _getNextUserAddress();
            vm.deal(user, 100 ether);
            users[i] = user;
        }

        return users;
    }

    function _getNextUserAddress() internal returns (address payable) {
        address payable user = payable(address(uint160(uint256(nextUser))));
        nextUser = keccak256(abi.encodePacked(nextUser));
        return user;
    }

}