pragma solidity ^0.4.24;


/**
 * @title EmissionsState
 * @dev This contract stores emissions state for an address
 */
contract EmissionsStorage {

    mapping (address => uint256) public emissions;
    
}
