// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract AuditLog is Ownable {
    mapping(string => mapping(string => string)) logs;

    function log(string memory _dealID, string memory _fileID, string memory _filehash) public onlyOwner {
        logs[_dealID][_fileID] = _filehash;
    }

    function getLog(string memory _dealID, string memory _fileID) public view returns (string memory) {
        return logs[_dealID][_fileID];
    }
}
