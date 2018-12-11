pragma solidity 0.4.24;

import "../interfaces/IEmissionsReduction.sol";


contract EmissionsReduction is IEmissionsReduction {

    IEmissions internal baseline;
    IEmissions internal project;
    IEmissions internal leakage;

    constructor(
        IEmissions _baseline,
        IEmissions _project,
        IEmissions _leakage) {

        baseline = _baseline;
        project = _project;
        leakage = _leakage;
    }

    function calculate(
        bytes baselineData,
        bytes projectData,
        bytes leakageData)
        external view returns (uint256) {

        uint256 baselineEmissions = baseline.calculate(baselineData);
        uint256 projectEmissions = project.calculate(projectData);
        uint256 leakageEmissions = leakage.calculate(leakageData);

        // TODO: Add FixedPointSafeMath.  Convert to int256?
        require(projectEmissions > leakageEmissions);
        require(baselineEmissions > projectEmissions + leakageEmissions);

        return baselineEmissions - projectEmissions - leakageEmissions;

    }

}
