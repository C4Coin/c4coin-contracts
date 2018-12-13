pragma solidity ^0.4.24;


interface IEmissions {

    function calculate(int64[16] data) external view returns (int64);

}
