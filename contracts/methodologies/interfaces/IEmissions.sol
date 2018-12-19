pragma solidity ^0.4.24;


interface IEmissions {

    function isValid(address a) external returns (bool);

    function emissions(address a) external returns (uint256);

}
