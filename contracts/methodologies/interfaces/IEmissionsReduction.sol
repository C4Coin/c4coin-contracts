pragma solidity ^0.4.24;


interface IEmissionsReduction {

    function calculate(
        bytes baselineData,
        bytes projectData,
        bytes leakageData)
        external returns (uint256);

}
