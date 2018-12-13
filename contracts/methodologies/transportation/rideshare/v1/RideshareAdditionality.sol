pragma solidity 0.4.24;

import "../../../interfaces/IAdditionality.sol";


contract RideshareAdditionality is IAdditionality {

    enum AdditionalityParamTypes {
        Invalid,
        CommunityPoolHHI,
        UserPoolFreq
    }

    modifier isAdditionalityParamTypes(uint256 a) {
        require(AdditionalityParamTypes(a) != AdditionalityParamTypes.Invalid);
        require(AdditionalityParamTypes(a) <= AdditionalityParamTypes.UserPoolFreq);
        _;
    }

    function verify(int64[16] data) external view returns (bool) {

        // If rideshare pool is dominant market in community then not additional.
        int64 hhi = data[uint64(AdditionalityParamTypes.CommunityPoolHHI)];

        if (hhi >= 2500) {
            return false;
        }

        int64 userPoolFreq = data[uint256(AdditionalityParamTypes.UserPoolFreq)];
        if (userPoolFreq <= 36) {
            return false;
        }

        return true;
    }

}
