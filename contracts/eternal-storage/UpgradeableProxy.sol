pragma solidity ^0.4.24;


import './Proxy.sol';
import './VersionStorage.sol';

/**
 * @title UpgradeableProxy
 * @dev This contract is a versioned proxy where the implementation address
 * to which it will delegate can be upgraded.
 */
contract UpgradeableProxy is Proxy, VersionStorage {

    /**
    * @dev This event will be emitted every time the implementation gets upgraded
    * @param version representing the version number of the upgraded implementation
    * @param implementation representing the address of the upgraded implementation
    */
    event Upgraded(uint256 version, address indexed implementation);

    /**
    * @dev Upgrades the implementation address
    * @param newImplementation representing the address of the new implementation to be set
    * @return bool on whether implementation was updated
    */
    function _upgradeTo(address newImplementation) internal returns (bool) {
        if (newImplementation == address(0)) return false;
        if (_implementation == newImplementation) return false;

        _implementation = newImplementation;
        _version = _version + 1;

        emit Upgraded(_version, newImplementation);
        return true;
    }

}
