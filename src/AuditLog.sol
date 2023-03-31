// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract AuditLog is Ownable {
    mapping(bytes32 => mapping(bytes32 => bytes32)) logs;

    function log(bytes32 _dealID, bytes32 _fileID, bytes32 _filehash) public onlyOwner {
        logs[_dealID][_fileID] = _filehash;
    }

    function getLog(bytes32 _dealID, bytes32 _fileID) public view returns (bytes32) {
        return logs[_dealID][_fileID];
    }
}
