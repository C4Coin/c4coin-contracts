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
        require(_implementation != implementation);
        _version = version;
        _implementation = implementation;
        Upgraded(version, implementation);
    }

}
