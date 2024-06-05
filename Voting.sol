// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Voting {
    mapping(address => uint) public votesReceived;
    address[] public candidates;

    constructor(address[] memory candidateAddresses) {
        candidates = candidateAddresses;
    }

    function vote(address candidate) public {
        require(validCandidate(candidate), "Candidate not valid");
        votesReceived[candidate] += 1;
    }

    function validCandidate(address candidate) view public returns (bool) {
        for(uint i = 0; i < candidates.length; i++) {
            if (candidates[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}
