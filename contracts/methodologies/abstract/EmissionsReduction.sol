pragma solidity 0.4.24;

import "../interfaces/IAdditionality.sol";
import "../interfaces/IEmissions.sol";
import "../interfaces/IEmissionsReduction.sol";


contract EmissionsReduction is IEmissionsReduction {

    IEmissions internal baseline;
    IEmissions internal project;
    IEmissions internal leakage;
    IAdditionality internal additionality;

    constructor(
        IAdditionality _additionality,
        IEmissions _baseline,
        IEmissions _project,
        IEmissions _leakage) {

        additionality = _additionality;
        baseline = _baseline;
        project = _project;
        leakage = _leakage;
    }

    function calculate(
        int64[16] additionalityData,
        int64[16] baselineData,
        int64[16] projectData,
        int64[16] leakageData)
        external view returns (int64) {

        bool additionalityCriteria = additionality.verify(additionalityData);
        require(additionalityCriteria);

        int64 baselineEmissions = baseline.calculate(baselineData);
        int64 projectEmissions = project.calculate(projectData);
        int64 leakageEmissions = leakage.calculate(leakageData);

        // TODO: Add FixedPointSafeMath.  Convert to int256?
        require(projectEmissions > leakageEmissions);
        require(baselineEmissions > projectEmissions + leakageEmissions);

        return baselineEmissions - projectEmissions - leakageEmissions;

    }

}
