pragma solidity ^0.4.4;
import "./../headers/iAcl.sol";

contract Acl is IAcl
{
    mapping (address => bool) Principals;
    address PrincipalOwner;

    function Acl(address owner)
    {
        PrincipalOwner = owner;
    }

    function Add(address user)
    {
        if (msg.sender == PrincipalOwner)
        {
            Principals[user] = true;
        }
    }

    function Remove(address user)
    {
        if (msg.sender == PrincipalOwner)
        {
            Principals[user] = false;
        }
    }

    function IsAuthorized(address user) constant returns (bool)
    {
        return Principals[user] || user == PrincipalOwner;
    }

    function GetOwner() constant returns (address)
    {
        return PrincipalOwner;
    }

    function ChangeOwner(address owner)
    {
        if (msg.sender == PrincipalOwner)
        {
            PrincipalOwner = owner;
        }
    }
}
