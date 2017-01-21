pragma solidity ^0.4.4;
import "./iEncryptedContainer.sol";

contract IEncryptionFactory
{
    function CreateContainer(IParty owner, IParty authorizedReader, string contentHash, string content) returns (IEncryptedContainer);
}