pragma solidity 0.4.24;

import "./EternalStorage.sol";
import "./OwnedUpgradeableProxy.sol";
import "./IEternalStorageProxy.sol";


/**
 * @title EternalStorageProxy
 * @dev This proxy holds the storage of the token contract and delegates every call to the current implementation set.
 * Besides, it allows to upgrade the token's behaviour towards further implementations, and provides
 * authorization control functionalities
 */
contract EternalStorageProxy is EternalStorage, OwnedUpgradeableProxy, IEternalStorageProxy {

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
        _setOwner(msg.sender);
    }


    function getOwner() public view returns(address) {
        return addressStorage[OWNER];
    }

    function getProxyStorage() public view returns(address) {
        return addressStorage[PROXY_STORAGE];
    }

    /**
     * @dev Allows the current owner to relinquish ownership.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipRenounced(getOwner());
        transferOwnership(address(0));
    }

    function _setProxyStorage(address _proxyStorage) private {
        addressStorage[PROXY_STORAGE] = _proxyStorage;
    }

}
