pragma solidity 0.4.24;

import './UpgradeableProxy.sol';
import 'openzeppelin-solidity/ownership/Ownable.sol';


/**
 * @title OwnedUpgradeabilityProxy
 * @dev This contract allows fo ownership of an upgradeable proxy
 */
contract OwnedUpgradeableProxy is Ownable, UpgradeabilityProxy {

    /**
    * @dev Allows owner to upgrade the current version of the proxy.
    * @param version representing the version name of the new implementation to be set.
    * @param implementation representing the address of the new implementation to be set.
    */
    function upgradeTo(string version, address implementation) public onlyOwner {
        _upgradeTo(version, implementation);
    }

    /**
    * @dev Allows owner to upgrade the current version of the proxy and call the new implementation
    * to initialize whatever is needed through a low level call.
    * @param version representing the version name of the new implementation to be set.
    * @param implementation representing the address of the new implementation to be set.
    * @param data represents the msg.data to bet sent in the low level call. This parameter may include the function
    * signature of the implementation to be called with the needed payload
    */
    function upgradeToAndCall(string version, address implementation, bytes data) payable public onlyOwner {
        upgradeTo(version, implementation);
        require(this.call.value(msg.value)(data));
    }
}
