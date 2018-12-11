pragma solidity 0.4.24;

import "../interfaces/IBaselineEmissions.sol";


contract BaselineEmissions is IBaselineEmissions {

    function baselineEmissions(bytes data) public pure returns (uint256);

}
