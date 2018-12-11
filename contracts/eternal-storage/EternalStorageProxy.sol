pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import "./EternalStorage.sol";
import "./UpgradeableProxy.sol";
import "./IEternalStorageProxy.sol";


/**
 * @title EternalStorageProxy
 * @dev This proxy holds the storage of the token contract and delegates every call to the current implementation set.
 * Besides, it allows to upgrade the token's behaviour towards further implementations, and provides
 * authorization control functionalities
 */
contract EternalStorageProxy is Ownable, EternalStorage, UpgradeableProxy, IEternalStorageProxy {

    bytes32 internal constant OWNER = keccak256("owner");
    bytes32 internal constant PROXY_STORAGE = keccak256("proxyStorage");


    modifier onlyProxyStorage() {
        require(msg.sender == getProxyStorage());
        _;
    }

    constructor(address _proxyStorage, address _implementationAddress) public {
        require(_implementationAddress != address(0));

        if (_proxyStorage != address(0)) {
            _setProxyStorage(_proxyStorage);
        } else {
            _setProxyStorage(address(this));
        }

        _implementation = _implementationAddress;
    }


    function getOwner() public view returns(address) {
        return addressStorage[OWNER];
    }

    function getProxyStorage() public view returns(address) {
        return addressStorage[PROXY_STORAGE];
    }

    function _setProxyStorage(address _proxyStorage) private {
        addressStorage[PROXY_STORAGE] = _proxyStorage;
    }

    /**
    * @dev Allows owner to upgrade the current version of the proxy.
    * @param implementation representing the address of the new implementation to be set.
    */
    function upgradeTo(address implementation) external onlyOwner returns (bool) {
        return _upgradeTo(implementation);
    }

    /**
    * @dev Allows owner to upgrade the current version of the proxy and call the new implementation
    * to initialize whatever is needed through a low level call.
    * @param implementation representing the address of the new implementation to be set.
    * @param data represents the msg.data to bet sent in the low level call. This parameter may include the function
    * signature of the implementation to be called with the needed payload
    */
    function upgradeToAndCall(address implementation, bytes data) payable external onlyOwner returns (bool) {
        bool updateSuccess = _upgradeTo(implementation);
        if (!updateSuccess) return false;
        require(address(this).call.value(msg.value)(data));
        return true;
    }
}
