pragma solidity 0.4.24;

import "./BaselineEmissions.sol";
import "./ProjectEmissions.sol";
import "./LeakageEmissions.sol";
import "../interfaces/IEmissionsReduction.sol";

contract EmissionsReduction is BaselineEmissions, ProjectEmissions, LeakageEmissions, IEmissionsReduction {

    function emissionsReduction(
        bytes32 baselineData,
        bytes32 projectData,
        bytes32 leakageData)
        public view returns (uint256) { // Can this be pure?

        uint256 baseline = baselineEmissions(baselineData);
        uint256 project = projectEmissions(projectData);
        uint256 leakage = leakageEmissions(leakageData);

        require(p > l);
        require(b > p + l);

        return b - p - l; // SafeMath here
    }

}
