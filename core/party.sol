pragma solidity ^0.4.4;
import "./../headers/iPublicKeyChain.sol";
import "./../headers/iParty.sol";
import "./../headers/iAcl.sol";

contract Party is IParty
{
    IPublicKeyChain public KeyChain;
    IAcl AuthorizedOwners;
    IAcl AuthorizedEditors;

    function Party(IAcl owners, IAcl editors, IPublicKeyChain keyChain)
    {
        KeyChain = keyChain;
        AuthorizedOwners = owners;
        AuthorizedEditors = editors;
    }

    function IsOwner(address user) constant returns (bool)
    {
        return AuthorizedOwners.GetOwner() == user;
    }

    function IsAuthorizedEditor(address user) constant returns (bool)
    {
        return AuthorizedEditors.IsAuthorized(user);
    }

    function AddEditor(address user) 
    {
        AuthorizedEditors.Add(user);
    }
}