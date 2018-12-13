pragma solidity ^0.4.24;


interface IEmissionsReduction {

    function calculate(
        int32[64] additionalityData,
        int32[64] baselineData,
        int32[64] projectData,
        int32[64] leakageData)
        external view returns (uint256);

}
