pragma solidity ^0.4.24;

import "../../../libraries/FixedPointSafeMath.sol";
import "../../../abstract/EmissionsStorage.sol";
import "../../../abstract/ValidityStorage.sol";
import "./libraries/EmissionsLib.sol";
import "./libraries/BaselineLib.sol";


/**
 * @title RideshareBaselineStorage
 * @dev This contract stores baseline emissions state
 */
contract RideshareBaselineStorage is EmissionsStorage, ValidityStorage {

    using FixedPointSafeMath for uint256;

    /**
    * @dev Updates baseline validity for a rider
    * @param rider .
    * @param alternativeTransportTime  . (km)
    * @param rideshareTime .
    * @param numRidepools .
    * @param numCommutes .
    */
    function setValidity(
        address rider,
        uint256 alternativeTransportTime,
        uint256 rideshareTime,
        uint256 numRidepools,
        uint256 numCommutes) public {

        validity[rider] = BaselineLib.isValid(
            alternativeTransportTime,
            rideshareTime,
            numRidepools,
            numCommutes
        );

    }

    /**
     * @dev Calculates emissions given distance and electric vehicle parameters
     * @param rider Address of rider
     * @param rideCount Number of times this ride is done per baseline interval
     * @param distance Distance traveled by vehicle with occupants (km)
     * @param electricEfficiency Vehicle electric efficiency (kWh/km)
     * @param electricityGenerationEmissions Electricity gen. emissions corresponding to project area (tCO2/kWH)
     */
    function setElectric(
        address rider,
        uint256 rideCount,
        uint256 distance,
        uint256 electricEfficiency,
        uint256 electricityGenerationEmissions) onlyValid(rider) public {

        emissions[rider] = EmissionsLib.electric(
            distance,
            electricEfficiency,
            electricityGenerationEmissions).mul(rideCount);

        validity[rider] = false;

    }

    /**
     * @dev Calculates emissions given distance and fossil-fuel parameters
     * @param rider Address of rider
     * @param rideCount Number of times this ride is done per baseline interval
     * @param distance Distance traveled by vehicle with occupants (km)
     * @param fuelEfficiency Vehicle fossil fuel efficiency (L/km)
     * @param emissionsFactor Emissions factor used for vehicle (tCO2/L)
     */
    function setFossilFuel(
        address rider,
        uint256 rideCount,
        uint256 distance,
        uint256 fuelEfficiency,
        uint256 emissionsFactor) onlyValid(rider) public {

        emissions[rider] = EmissionsLib.fossilFuel(
            distance,
            fuelEfficiency,
            emissionsFactor).mul(rideCount);

        validity[rider] = false;

    }

    /**
     * @dev Calculates emissions given distance and fossil-fuel & electric parameters
     * @param rider Address of rider
     * @param rideCount Number of times this ride is done per baseline interval
     * @param distance Distance traveled by vehicle with occupants (km)
     * @param fuelEfficiency Vehicle fossil fuel efficiency (L/km)
     * @param emissionsFactor Emissions factor used for vehicle (tCO2/L)
     * @param electricEfficiency Vehicle electric efficiency (kWh/km)
     * @param electricityGenerationEmissions Electricity gen. emissions corresponding to project area (tCO2/kWH)
     * @param electricRange Vehicle electric range (km)
     */
    function setHybrid(
        address rider,
        uint256 rideCount,
        uint256 distance,
        uint256 fuelEfficiency,
        uint256 emissionsFactor,
        uint256 electricEfficiency,
        uint256 electricityGenerationEmissions,
        uint256 electricRange) onlyValid(rider) public {

        emissions[rider] = EmissionsLib.hybrid(
            distance,
            fuelEfficiency,
            emissionsFactor,
            electricEfficiency,
            electricityGenerationEmissions,
            electricRange).mul(rideCount);

        validity[rider] = false;

    }

}
