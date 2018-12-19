pragma solidity 0.4.24;

import "../../../../libraries/FixedPointSafeMath.sol";


/**
 * @title MarketLib
 * @dev This library helps with HHI and dominant market calculations
 */
library MarketLib {
    using FixedPointSafeMath for uint256;

    uint256 constant public DOMINANT_MARKET_HHI_MIN = 2500 ether;

    /**
    * @dev Calculates HHI given market shares
    * @param marketShares An array of market share percentages (0.0 - 100.0 ether)
    * @return Returns HHI
    */
    function hhi(uint256[] marketShares) public pure returns (uint256) {

        uint256 _hhi = 0;
        for (uint256 i=0; i<marketShares.length; i++) {

            uint share = marketShares[i];
            require(share >= 0 ether);
            require(share <= 100 ether);

            _hhi += share.mul(share);
        }

        return _hhi;

    }

    /**
    * @dev Determines if dominant market exists given market shares
    * @param marketShares An array of market share percentages (0.0 - 100.0 ether)
    * @return Returns true if a dominant market exists and false otherwise
    */
    function dominantMarketExists(uint256[] marketShares) public pure returns (bool) {

        // Compute HHI given market shares
        uint256 _hhi = hhi(marketShares);

        // Check if a dominant market exists
        return _hhi >= DOMINANT_MARKET_HHI_MIN;

    }

}
