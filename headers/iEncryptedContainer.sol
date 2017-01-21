pragma solidity ^0.4.4;
import "./iParty.sol";

contract IEncryptedContainer
{
    function GetContent(IParty party) constant returns (string);
    function UpdateContent(IParty party, string content);
    function RequestUpdate(IParty party);
}