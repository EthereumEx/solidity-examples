pragma solidity ^0.4.4;

contract IParty
{
    function IsOwner(address user) constant returns (bool);
    function IsAuthorizedEditor(address user) constant returns (bool);
    function AddEditor(address user); 
}