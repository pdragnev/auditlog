pragma solidity 0.8.16;

import "forge-std/Test.sol";
import "../src/AuditLogEvents.sol";
import "../src/AuditLog.sol";

contract ContractBTest is Test {
    AuditLogEvents public auditLogEvents;
    AuditLog public auditLog;
    uint256 nonce = 0;

    function setUp() public {
        auditLogEvents = new AuditLogEvents();
        auditLog = new AuditLog();
    }

    function testAuditLogEvents() public {
        for (uint256 i = 0; i < 100; i++) {
            for (uint256 j = 0; j < 1000; j++) {
                auditLogEvents.log(pseudoRandomNumberGenerator(), "testMessageHash", "testFileHash", "testDealID");
            }
        }
    }

    function testAuditLog() public {
        for (uint256 i = 0; i < 100; i++) {
            for (uint256 j = 0; j < 1000; j++) {
                auditLog.log(pseudoRandomNumberGeneratorString(), "testDealID", "testHash");
            }
        }
    }

    function pseudoRandomNumberGenerator() public returns (uint256) {
        nonce += 1;
        return uint256(keccak256(abi.encodePacked(nonce, msg.sender, blockhash(block.number - 1))));
    }

    function pseudoRandomNumberGeneratorString() public returns (string memory) {
        nonce += 1;
        bytes32 foo = keccak256(abi.encodePacked(nonce, msg.sender, blockhash(block.number - 1)));
        return string(abi.encodePacked(foo));
    }
}
