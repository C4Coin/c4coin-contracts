pragma solidity 0.4.24;


interface IEmissionsReduction {
    function emissionsReduction(
        bytes baselineData,
        bytes projectData,
        bytes leakageData)
        public view returns (uint256);
}
