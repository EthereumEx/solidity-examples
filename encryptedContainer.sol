pragma solidity ^0.4.4;
import "./headers/iEncryptedContainer.sol";

contract EncryptedContainer is IEncryptedContainer
{
    struct Content
    {
        uint Exists;
        string Value;
    }
    
    IParty[] public AuthorizedReaders;
    string public ContentHash;

    mapping (address => Content) ContentMap;
    IParty Owner;

    function EncryptedContainer(IParty owner, IParty authorizedReader, string contentHash, string content)
    {
        Owner = owner;
        ContentHash = contentHash;
        AuthorizedReaders.push(authorizedReader);
        ContentMap[authorizedReader].Value = content;
        ContentMap[authorizedReader].Exists = 1;
    }

    function GetContent(IParty party) constant returns (string)
    {
        return ContentMap[party].Value;
    }

    function UpdateContent(IParty party, string content)
    {
        if (Owner.IsAuthorizedEditor(msg.sender))
        {
            if (ContentMap[party].Exists == 0)
            {
                AuthorizedReaders.push(party);
            }
            
            ContentMap[party].Value = content;
            ContentMap[party].Exists = 1;
        }
    }

    function RequestUpdate(IParty party)
    {
        // do an event here
    }
}