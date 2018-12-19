pragma solidity ^0.4.24;


/**
 * @title ValidityStorage
 * @dev This abstract contract keeps track of valid states for addresses
 */
contract ValidityStorage {

    mapping (address => bool) public validity;

    modifier onlyValid(address a) {
        require(a != address(0));
        require(validity[a]);
        _;
    }

}
