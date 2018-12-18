pragma solidity 0.4.24;

import "../../../../libraries/FixedPointSafeMath.sol";


/**
 * @title RideshareAdditionalityCalc
 * @dev This contract checks if a rideshare project is additional
 */
contract RideshareAdditionalityCalc {
    using FixedPointSafeMath for uint256;

    uint256 public DOMINANT_MARKET_HHI_MIN = 2500 ether;
    uint256 public USER_RIDEPOOL_PERCENT_MIN = 36 ether;

    /**
    * @dev Checks if a user in an urban area is showing additional behavior
    * @param urbanAreaRideshares The percentage of all commuters ridesharing in an urban area (0.0 - 100.0 ether)
    * @param userRideshares The percentage of a specific user ridepooling instead of ridesharing (0.0 - 100.0 ether)
    * @return bool on whether implementation was updated
    */
    function isAdditional(uint256 urbanAreaRideshares, uint256 userRidepools) internal pure returns (bool) {

        require(urbanAreaRideshares >= 0 ether);
        require(urbanAreaRideshares <= 100 ether);

        if (urbanAreaRideshares.mul(urbanAreaRideshares) >= DOMINANT_MARKET_HHI_MIN) {
            return false;
        }

        if (userRidepools <= USER_RIDESHARE_PERCENT_MIN) {
            return false;
        }

        return true;
    }

}
