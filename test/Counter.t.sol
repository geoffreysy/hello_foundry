// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Helper.t.sol";
import "../src/Counter.sol";

contract CounterTest is Helper {
    Counter public counter;
    address public owner;
    address public receiver;

    constructor() {
        owner = testGlobalUsers[0];
        receiver = testGlobalUsers[1];
    }

    function setUp() public {
        vm.prank(owner);
        counter = new Counter();

        assertEq(counter.balanceOf(owner), 1000 ether);
    }

    /**
        Test transfer with fuzziness
     */
    function testTransfer(uint amount) public {
        vm.assume(amount > 1 ether);
        vm.assume(amount < 1000 ether);
 
        vm.prank(owner);
        counter.transfer(receiver, amount);
 
        assertEq(counter.balanceOf(owner), 1000 ether - amount);
        assertEq(counter.balanceOf(receiver), amount);
    }

}
