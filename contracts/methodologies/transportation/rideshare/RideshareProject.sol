import "./RideshareToken.sol";
import "./EmissionsCalc.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract RideshareProject is Ownable {
    using SafeMath for uint256;

    RideshareToken co2kn;
    EmissionsCalc ec;
    uint256 baseline; // Baseline emissions computed off-chain

    // TODO: Make this an initializable fn for ZOS
    // TODO: Should take an owner as input, not implicitly msg.sender as Ownable forces
    constructor (
        //address _owner,
        RideshareToken _co2kn,
        EmissionsCalc _ec,
        uint256 _baseline
    ) {
        //owner = _owner;
        co2kn = _co2kn;
        ec    = _ec;
    }

    function mintFromOffset(address _to) {
        // Get amount to mint from offset records
        uint256 emissions = ec.claimOffset();
        uint256 co2kns = baseline.sub(emissions); //.sub(leakage);

        co2kn.mint(_to, co2kns);
    }
}
