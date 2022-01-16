pragma solidity ^0.5.0;

contract DStorage {
  // Name
  string public name = 'DStorage';
  // Number of files
  uint public fileCount= 0;
  // Mapping fileId=>Struct  (key-value stored pair)
  // (data type of key-value pair)
  mapping(uint=>File) public files;
  
  // Struct of file
  struct File{
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime;
    address payable uploader;
  }

  // Event
  event FileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName,
    string fileDescription,
    uint uploadTime,
    address payable uploader
  );

  constructor() public {
  }

  // Upload File function
  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, string memory _fileName, string memory _fileDescription) public {
    // Any condition that is not met will break out of the code and return

    // Make sure the file hash exists
    require(bytes(_fileHash).length > 0);
    // Make sure file type exists
    require(bytes(_fileType).length > 0);
    // Make sure file description exists
    require(bytes(_fileDescription).length > 0);
    // Make sure file fileName exists
    require(bytes(_fileName).length > 0);
    // Make sure uploader address exists
    require(msg.sender!= address(0));
    // Make sure file size is more than 0
    require(_fileSize >0);

    // Increment file id 
    fileCount ++;

    // Add File to the contract
    // now will store current timestamp
    // msg.sender can get address of sender of the smart contract execution
    files[fileCount] = File(fileCount,_fileHash,_fileSize,_fileType, _fileName,_fileDescription,now,msg.sender);

    // Trigger an event
    emit FileUploaded(fileCount,_fileHash,_fileSize,_fileType, _fileName,_fileDescription,now,msg.sender);
  }

}