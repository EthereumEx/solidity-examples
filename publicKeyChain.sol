pragma solidity ^0.4.4;
import "./headers/iAcl.sol";
import "./headers/iPublicKeyChain.sol";

contract PublicKeyChain is IPublicKeyChain
{
    string public PublicKey;
    IAcl Owner;
    
    function PublicKeyChain(string key, IAcl owner)
    {
        PublicKey = key;
        Owner = owner;
    }

    function UpdateKey(string key)
    {
        if (Owner.IsAuthorized(msg.sender))
        {
            PublicKey = key;
        }
    }

    function IsAuthorized(address user) constant returns (bool)
    {
        return Owner.IsAuthorized(user);
    }
}