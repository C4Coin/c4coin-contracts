pragma solidity 0.4.24;

import "../../../interfaces/IAdditionality.sol";


contract RideshareAdditionality is IAdditionality {

    enum AdditionalityParamTypes {
        NumCommunityPoolHHI,
        DenCommunityPoolHHI,
        NumUserPoolFreq,
        DenUserPoolFreq
    }

    function verify(int32[32] data) external view returns (bool) {

        // If rideshare pool is dominant market in community then not additional.
        int32 numHHI = data[uint(AdditionalityParamTypes.NumCommunityPoolHHI)];

        if (numHHI >= 2500) {
            return false;
        }

        int32 numUserPoolFreq = data[uint(AdditionalityParamTypes.NumUserPoolFreq)];
        if (numUserPoolFreq <= 36) {
            return false;
        }

        return true;
    }

}
