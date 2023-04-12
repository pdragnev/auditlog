// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract AuditLogEvents is Ownable {
    event Log(uint256 indexed messageID, string messageHash, string fileHash, string dealID);

    function log(uint256 _messageID, string calldata _messageHash, string calldata _fileHash, string calldata _dealID)
        public
        onlyOwner
    {
        emit Log(_messageID, _messageHash, _fileHash, _dealID);
    }
}
