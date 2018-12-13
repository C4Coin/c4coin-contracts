pragma solidity ^0.4.24;


interface IEmissions {

    // Need 64 because of numerator & denomenator
    function calculate(int32[64] data) external view returns (uint256);

}
