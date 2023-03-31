// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AuditLog {
    mapping(bytes32 => mapping(bytes32 => bytes32)) logs;

    function log(bytes32 _dealNumber, bytes32 _fileMsg, bytes32 _filehash) public {
        emit Log(_dealNumber, _fileMsg, _filehash);
    }
}
