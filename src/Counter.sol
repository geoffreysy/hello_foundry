// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-token-erc20/ERC20.sol";

contract Counter is ERC20 {

    constructor() ERC20("Counter", "CTR") {
        _mint(msg.sender, 1000 ether);
    }

}
