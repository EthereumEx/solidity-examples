pragma solidity ^0.4.4;

contract IAcl
{
    function Add(address user);
    function Remove(address user);
    function IsAuthorized(address user) constant returns (bool);
    function GetOwner() constant returns (address);
    function ChangeOwner(address owner);
}
