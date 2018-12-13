pragma solidity 0.4.24;

import "../../../interfaces/IAdditionality.sol";


contract RideshareAdditionality is IAdditionality {

    function verify(bytes data) public pure returns (bool) {

        // if HHI of zone shows a dominant market of 2 drivers

        // AND

        // if this user's frequency of ridesharing with >2 people is greater
        // then 35% then it is additional (must reset each season)

        return false;
    }

}
