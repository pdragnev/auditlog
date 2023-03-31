// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract AuditLogEvents is Ownable {
    event Log(uint256 dealID, uint256 fileID, uint256 filehash);

    function log(uint256 _dealID, uint256 _fileID, uint256 _filehash) public onlyOwner {
        emit Log(_dealID, _fileID, _filehash);
    }
}
