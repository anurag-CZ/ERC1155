//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface ERC1155 {
    // TransferSingle and Transferbatch must emit when tokens are transferred, including zero value transfer as well as minting and burning.
    // _operator must be the address of the account/contract that is approved to make transfer.
    // _from is the address from which the token is transferred. _to is the address to which the tokens are transferred.
    // _id & _ids are the token type and lists of token type being transferred respectively.
    //_value must be the number of tokens by which holder balance is decreased by and match what the recipient balance is increased by.
    //_values must be the lists of number of tokens by which holder balance is decreased by and match what the recipient balance is increased by.
    
    event TransferSingle(address indexed _operator, address indexed _from, address indexed _to, uint _id, uint _value);

    event TransferBatch(address indexed _operator, address indexed _from, address indexed _to, uint[] _ids, uint[] _values);

    // must emit when approval for _operator address to manage all tokens of _owner is enabled/ disabled.
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    // must emit when URI is updated for token _id
    event URI(string _value, uint indexed _id);

    function safeTransferFrom(address _from, address _to, uint _id, uint _value, bytes calldata _data) external;

    function safeBatchTransferFrom(address _from, address _to, uint[] calldata _ids, uint[] calldata _values, bytes calldata _data) external;

    function balanceOf(address _owner, uint _id) external view returns(uint);

    function balanceOfBatch(address[] calldata _owner, uint[] calldata _id) external view returns(uint[] memory);

    function setApprovalForAll(address _operator, bool _approved) external;

    function isApprovedForAll(address _owner, address _operator) external view returns(bool);
}



interface ERC1155TokenReceiver {
    function onERC1155Received(address _operator, address _owner, uint _id, uint _value, bytes calldata _data) external view returns(bytes4);

    function onERC1155BatchReceived(address _operator, address _owner, uint[] calldata _ids, uint[] calldata _values, bytes calldata _data) external view returns(bytes4);
}

interface ERC1155Metadata_URI {
     function uri(uint _id) external view returns(string memory);
}