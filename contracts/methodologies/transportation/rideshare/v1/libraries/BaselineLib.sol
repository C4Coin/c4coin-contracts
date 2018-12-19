pragma solidity ^0.4.24;

import "../../../../libraries/FixedPointSafeMath.sol";


/**
 * @title BaselineLib
 * @dev This library helps determine whether a baseline scenario is valid
 */
library BaselineLib {

    using FixedPointSafeMath for uint256;

    uint256 constant public RIDEPOOL_RATIO = 36 ether;

    /**
    * @dev Determines whether a baseline scenario has valid criteria
    * @param alternativeTransportTime  . (km)
    * @param rideshareTime .
    * @param numRidepools .
    * @param numCommutes .
    * @return Whether the baseline criteria is met
    */
    function isValid(
        uint256 alternativeTransportTime,
        uint256 rideshareTime,
        uint256 numRidepools,
        uint256 numCommutes) public pure returns (bool) {

        if (alternativeTransportTime + 15 minutes <= rideshareTime) {
            return false;
        } else if ( numRidepools.div(numCommutes) < RIDEPOOL_RATIO) {
            return false;
        } else {
            return true;
        }

    }

}
