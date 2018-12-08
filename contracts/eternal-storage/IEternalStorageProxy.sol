pragma solidity 0.4.24;


/**
 * @title IEternalStorageProxy
 * @dev This interface is for a proxy contract which can be upgraded to new implementations.
 */
interface IEternalStorageProxy {

    function upgradeTo(address) external returns (bool);

}
