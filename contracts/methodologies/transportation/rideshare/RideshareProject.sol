import "../RideshareToken.sol";
import "./EmissionsCalc.sol";
import "openzeppelin-solidity/contracts/";

contract RideshareProject is Ownable {
    RideshareToken co2kn;
    EmissionsCalc ec;
    uint256 baseline; // Baseline emissions computed off-chain

    // TODO: Make this an initializable fn for ZOS
    constructor (
        address _owner,
        RideshareToken _co2ken,
        EmissionsCalc _ec,
        uint256 _baseline
    ) {
        owner = _owner;
        co2kn = _co2kn;
        ec    = _ec;
    }

    function mintFromOffset(_to address) {
        // Get amount to mint from offset records
        uint256 emissions = ec.claimOffset();
        uint256 co2kns = baseline - amount; // - leakage;

        co2kn.mint(co2kns, _to);
    }
}
