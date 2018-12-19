pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";


/**
 * @title FixedPointSafeMath
 * @dev Math operations on fixed point represented using ether units
 */
library FixedPointSafeMath {

    using SafeMath for uint256;

    /**
    * @dev Multiplies two fixed point numbers, reverts on overflow.
    * @dev Must divide by 1e18 (1 ether) to move decimal place back.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a.mul(b).div(1 ether);
    }

    /**
    * @dev Integer division of two fixed point numbers
    * @dev Must multiply by 1e18 (1 ether) to move left then divide.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a.mul(1 ether).div(b);
    }

    /**
    * @dev Subtracts two fixed point numbers
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a.sub(b);
    }

    /**
    * @dev Adds two fixed point numbers
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a.add(b);
    }

}
