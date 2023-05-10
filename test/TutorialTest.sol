// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "src/RSKToken.sol";
import "src/TutorialContract.sol";
import "forge-std/console2.sol";

// We are using an external testing methodology
contract TutorialTest {
    CoinA coina;
    TokenDistribution tokendistribution;
    event Log(uint256 ok);
     // setup
    constructor() {
        // Create the token and mint a bunch of tokens
        coina = new CoinA();
        // Create target system
        tokendistribution = new TokenDistribution(address(coina));  
    }
    function t2osq(uint256 transfernumber) public  payable {

        coina.transfer(address(tokendistribution), transfernumber);
        require(tokendistribution.getmembernumber() > 1);

        tokendistribution.distributeTokens();

        assert(tokendistribution.getContractBalance() == 0);
        
    }
}