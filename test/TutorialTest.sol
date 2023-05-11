// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "src/RSKToken.sol";
import "src/TutorialContract.sol";

// We are using an external testing methodology
contract TutorialTest {
    CoinA coina;
    TokenDistribution tokendistribution;
     // setup
    constructor() {
        // Create the token and mint a bunch of tokens
        coina = new CoinA();
        // Create target system
        tokendistribution = new TokenDistribution(address(coina));  
    }

    function t2osq(uint256 transfernumber, address[] memory _member) public  payable returns(uint256) {
        coina.transfer(address(tokendistribution), transfernumber);
        for (uint i = 0; i < _member.length; i++) {
            tokendistribution.addMember(_member[i]);
        }
        require(tokendistribution.getmembernumber() > 0);

        tokendistribution.distributeTokens();

        assert(tokendistribution.getContractBalance() == 0);
        return tokendistribution.getContractBalance();
        
    }
}
