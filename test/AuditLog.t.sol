// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "../src/AuditLog.sol";
import "../src/AuditLogEvents.sol";

contract AuditLogTest is Test {
    AuditLog public auditLog;
    AuditLogEvents public auditLogEvents;
    uint256 nonce = 0;

    function setUp() public {
        auditLog = new AuditLog();
        auditLogEvents = new AuditLogEvents();
    }

    function testAuditLog() public {
        for (uint256 i = 0; i < 100; i++) {
            for (uint256 j = 0; j < 1000; j++) {
                auditLog.log(i, j, PRNG());
            }
        }
    }

    function testAuditLogEvents() public {
        for (uint256 i = 0; i < 100; i++) {
            for (uint256 j = 0; j < 1000; j++) {
                auditLogEvents.log(i, j, PRNG());
            }
        }
    }

    function PRNG() public returns (uint256) {
        nonce += 1;
        return uint256(keccak256(abi.encodePacked(nonce, msg.sender, blockhash(block.number - 1))));
    }
}
