pragma solidity 0.4.24;


interface IEmissions {
    function emissions(bytes32 data) public view returns (uint256);
}
