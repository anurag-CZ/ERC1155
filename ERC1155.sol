//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155Token is ERC1155 {
    address public owner;
    constructor() ERC1155("Uri") {
        owner = msg.sender;
        _mint(msg.sender, 0, 1, "Special");
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Caller is not Owner");
        _;
    }

    function mint(address _to, uint _id, uint _value, bytes memory _data) public onlyOwner {
        _mint(_to, _id, _value, _data);
    }

    function mintBatch(address _to, uint[] memory _ids, uint[] memory _values, bytes memory _data) public onlyOwner {
        _mintBatch(_to, _ids, _values, _data);
    }
    
    function burn(address _from, uint _id, uint _amount) public onlyOwner {
        _burn(_from, _id, _amount);
    }

    function burnBatch(address _from, uint[] memory _ids, uint[] memory _amounts) public onlyOwner {
        _burnBatch(_from, _ids, _amounts);
    }
}