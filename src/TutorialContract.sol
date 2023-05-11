//Patrick Sfeir
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract TokenDistribution {
    using SafeERC20 for IERC20;
    IERC20 public token;

    uint256 public newmember;
    uint256 constant MINIMUM_AMOUNT = 10_000;
    //uint256 public totalTokens;
    address[] public memberList;
    mapping(address => bool) isMemberMap;
    uint public gasUsed;
    error memberlisted(string message);
    error memberrevert(string message);
    error balancerevert(string message);

    constructor(address _token) {
        token = IERC20(_token);
    }
    function isMember(address _member) public view returns (bool) {
        return isMemberMap[_member];
    }
    function addMember(address _member) public {
        require(_member != address(0));
        if (isMember(_member)) revert memberlisted({message:"Member is already in the list"});
        memberList.push(_member);
        isMemberMap[_member] = true;
        newmember++;

    }
    function getmembernumber() public view returns (uint256) {
        return newmember;
    }

    function getContractBalance() public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    function distributeTokens() public payable returns (uint256, uint256)  {
        require(getmembernumber() > 0, "Members should be greater");
        uint256 numMembers = memberList.length;
        if (numMembers == 0) revert memberrevert({message:"No members to distribute tokens to"});
        if (getContractBalance() < numMembers) revert balancerevert({message:"Balance should be greater"});
        uint256 tokensPerMember = getContractBalance() / numMembers;
        uint initialGas = gasleft();
        for (uint256 i = 0; i < numMembers; i++) {
            token.transfer(memberList[i], tokensPerMember);
            if (gasleft() < MINIMUM_AMOUNT) break;
        }

            uint finalGas = gasleft();     
            gasUsed = initialGas - finalGas;
            return(initialGas, finalGas);
        }

    receive() external payable {}
}
