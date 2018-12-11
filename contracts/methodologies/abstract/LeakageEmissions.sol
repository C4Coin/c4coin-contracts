pragma solidity 0.4.24;

import "../interfaces/ILeakageEmissions.sol";


contract LeakageEmissions is ILeakageEmissions {

    function leakageEmissions(bytes data) public pure returns (uint256);

}
