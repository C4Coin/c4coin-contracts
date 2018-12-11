pragma solidity ^0.4.24;


interface IEmissions {

    function calculate(bytes data) external returns (uint256);

}
