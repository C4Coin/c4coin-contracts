pragma solidity ^0.4.24;

import "./SignedSafeMath.sol";


/**
 * @title FixedPointSafeMath
 * @dev Math operations on 64-bit fixed point (2x32 bit tuple)
 * with safety checks that throw on error.
 */
library FixedPointSafeMath {
    using SignedSafeMath for int32;

    /**
    * @dev Multiplies two signed fixed point integers, throws on overflow.
    */
    function mul(int32 a_num, int32 a_den, int32 b_num, int32 b_den) internal pure returns (int32 c_num, int32 c_den) {
        return (a_num.mul(b_num), a_den.mul(b_den));
    }

    /**
    * @dev Integer division of two signed fixed point integers, truncating the quotient.
    */
    function div(int32 a_num, int32 a_den, int32 b_num, int32 b_den) internal pure returns (int32, int32) {
        return (a_num.div(b_num), a_den.div(b_den));
    }

    /**
    * @dev Subtracts two signed fixed point integers, throws on overflow.
    */
    function sub(int32 a_num, int32 a_den, int32 b_num, int32 b_den) internal pure returns (int32 c_num, int32 c_den) {
        c_num = a_num.sub(b_num);
        c_den = a_den.sub(b_den);
        return (c_num, c_den);
    }

  /**
  * @dev Adds two signed 32-bit integers, throws on overflow.
  */
  function add(int32 a_num, int32 a_den, int32 b_num, int32 b_den) internal pure returns (int32 c_num, int32 c_den) {
      c_num = a_num.add(b_num);
      c_den = a_den.add(b_den);
      return (c_num, c_den);
  }
}
