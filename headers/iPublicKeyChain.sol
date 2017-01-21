pragma solidity ^0.4.4;

contract IPublicKeyChain
{
    function UpdateKey(string key);
    function IsAuthorized(address user) constant returns (bool);
}