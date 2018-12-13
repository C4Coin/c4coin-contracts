pragma solidity ^0.4.24;


interface IEmissions {

    function calculate(int32[32] data) external view returns (int32);

}
