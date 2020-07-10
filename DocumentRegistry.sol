pragma solidity ^0.5.16;

contract DocumentRegistry {

    struct Document {
        string hash;
        uint256 dateAdded;
    }

    Document[] private documents;
    address contractOwner;

    modifier onlyOwner() {
        require(contractOwner == msg.sender, "Not a contract owner!");
        _;
    }

    constructor() public {
        contractOwner = msg.sender;
    }

    function add(string memory hash) public onlyOwner returns (uint256 dateAdded) {
        uint256 currentTime = block.timestamp;
        Document memory doc = Document(hash, dateAdded);
        documents.push(doc);
        return currentTime;
    }

    function getDocumentsCount() view public returns (uint256 documentCount) {
        documentCount = documents.length;
    }

    function getDocument(uint256 index) view public returns (string memory hash, uint256 dateAdded) {
       Document memory document = documents[index];
       return (document.hash, document.dateAdded);
    }
}
