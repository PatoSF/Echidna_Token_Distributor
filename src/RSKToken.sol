// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CoinA is ERC20 {
    constructor() ERC20("RareSkill", "RSK") {
        _mint(msg.sender, 1000000000 * 10 ** decimals());
    }
}
