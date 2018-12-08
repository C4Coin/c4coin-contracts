pragma solidity 0.4.24;


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
    * @param version representing the version name of the new implementation to be set
    * @param implementation representing the address of the new implementation to be set
    */
    function _upgradeTo(uint256 version, address implementation) internal {
        if (newImplementation == address(0)) return false;
        if (_implementation == newImplementation) return false;

        uint256 newVersion = _version + 1;
        if (newVersion <= _version) return false;

        _version = newVersion;
        _implementation = newImplementation;

        emit Upgraded(newVersion, newImplementation);
        return true;
    }

}
