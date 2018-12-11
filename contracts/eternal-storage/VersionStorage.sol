pragma solidity ^0.4.24;


/**
 * @title VersionStorage
 * @dev This contract holds all the necessary state variables for versioning
 * and accessing the current implementation.
 */
contract VersionStorage {

    uint256 internal _version;
    address internal _implementation;

    /**
    * @dev Gets the version number of the current implementation
    * @return uint256 representing the current version
    */
    function version() public view returns (uint256) {
        return _version;
    }

    /**
    * @dev Gets the address of the current implementation
    * @return address of the current implementation
    */
    function implementation() public view returns (address) {
        return _implementation;
    }

}
