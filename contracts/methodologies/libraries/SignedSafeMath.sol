pragma solidity ^0.4.24;


/**
 * @title SignedSafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SignedSafeMath {
  int64 constant INT32_MIN = int32((uint32(1) << 31));

  /**
  * @dev Multiplies two signed integers, throws on overflow.
  */
  function mul(int32 a, int32 b) internal pure returns (int32 c) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }
    c = a * b;
    assert((a != -1 || b != INT32_MIN) && c / a == b);
  }

  /**
  * @dev Integer division of two signed integers, truncating the quotient.
  */
  function div(int32 a, int32 b) internal pure returns (int32) {
    // assert(b != 0); // Solidity automatically throws when dividing by 0
    // Overflow only happens when the smallest negative int is multiplied by -1.
    assert(a != INT32_MIN || b != -1);
    return a / b;
  }

  /**
  * @dev Subtracts two signed integers, throws on overflow.
  */
  function sub(int32 a, int32 b) internal pure returns (int32 c) {
    c = a - b;
    assert((b >= 0 && c <= a) || (b < 0 && c > a));
  }

  /**
  * @dev Adds two signed integers, throws on overflow.
  */
  function add(int32 a, int32 b) internal pure returns (int32 c) {
    c = a + b;
    assert((b >= 0 && c >= a) || (b < 0 && c < a));
  }
}
