pragma solidity 0.4.24;


interface IEmissions {
    function offset(bytes32 baselineData, bytes32 projectData, bytes32 leakageData) public view returns (uint256);
}
