pragma solidity ^0.4.24;


interface IEmissionsReduction {

    function calculate(
        int64[16] additionalityData,
        int64[16] baselineData,
        int64[16] projectData,
        int64[16] leakageData)
        external view returns (int64);

}
