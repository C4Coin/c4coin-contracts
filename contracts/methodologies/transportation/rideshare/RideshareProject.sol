pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "../../interfaces/IAdditionality.sol";
import "../../interfaces/IEmissions.sol";
import "./RideshareToken.sol"; // TODO: Use IBurnableToken


// Note this may be an abstract base class on its own independent of this methodology.
contract RideshareProject is Ownable {
    using SafeMath for uint256;

    RideshareToken co2kn;
    IAdditionality additionality;
    IEmissions baseline;
    IEmissions project;
    IEmissions leakage;

    // TODO: Make this an initializable fn for ZOS
    // TODO: Should take an owner as input, not implicitly msg.sender as Ownable forces
    constructor (
        RideshareToken _co2kn, // change this to an interface
        IAdditionality _additionality,
        IEmissions _baseline,
        IEmissions _project,
        IEmissions _leakage
    ) {

        co2kn = _co2kn;
        additionality = _additionality;
        baseline = _baseline;
        project = _project;

    }

    // TODO: Initialize and check additionality
    // function Initialize(...)

    // Move this to a abstract base class
    function mint(address _to) {

        // require additionality
        // require(additionality.isAdditional());

        // Get baseline, project and leakage emissions
        uint256 baselineEmissions = project.emissions(_to);
        uint256 projectEmissions = project.emissions(_to);
        uint256 leakageEmissions = 0;

        require(baselineEmissions > projectEmissions + leakageEmissions);
        require(projectEmissions > leakageEmissions);

        uint256 emissionReductions = baselineEmissions.sub(projectEmissions).sub(leakageEmissions);

        co2kn.mint(_to, emissionReductions);
    }
}
