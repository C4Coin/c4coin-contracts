pragma solidity ^0.4.24;

import "../../../libraries/FixedPointSafeMath.sol";
import "../../../abstract/EmissionsStorage.sol";
import "./libraries/EmissionsLib.sol";


/**
 * @title RideshareProjectStorage
 * @dev This contract stores project emissions state
 */
contract RideshareProjectStorage is EmissionsStorage {

    using FixedPointSafeMath for uint256;

    /**
     * @dev Calculates emissions given distance and electric vehicle parameters
     * @param riders Addresses of riders
     * @param distance Distance traveled by vehicle with occupants (km)
     * @param electricEfficiency Vehicle electric efficiency (kWh/km)
     * @param electricityGenerationEmissions Electricity gen. emissions corresponding to project area (tCO2/kWH)
     */
    function setElectric(
        address[] riders,
        uint256 distance,
        uint256 electricEfficiency,
        uint256 electricityGenerationEmissions) public { // only owner

        uint256 totalProjectEmissions = EmissionsLib.electric(
            distance,
            electricEfficiency,
            electricityGenerationEmissions);

        for ( uint256 i=0; i<riders.length; i++) {
            emissions[riders[i]] += totalProjectEmissions.div(riders.length);
        }

    }

    /**
     * @dev Calculates emissions given distance and fossil-fuel parameters
     * @param riders Addresses of riders
     * @param distance Distance traveled by vehicle with occupants (km)
     * @param fuelEfficiency Vehicle fossil fuel efficiency (L/km)
     * @param emissionsFactor Emissions factor used for vehicle (tCO2/L)
     */
    function setFossilFuel(
        address[] riders,
        uint256 distance,
        uint256 fuelEfficiency,
        uint256 emissionsFactor) public { // only owner

        uint256 totalProjectEmissions = EmissionsLib.fossilFuel(
            distance,
            fuelEfficiency,
            emissionsFactor);

        for ( uint256 i=0; i<riders.length; i++) {
            emissions[riders[i]] += totalProjectEmissions.div(riders.length);
        }

    }

    /**
     * @dev Calculates emissions given distance and fossil-fuel & electric parameters
     * @param riders Addresses of riders
     * @param distance Distance traveled by vehicle with occupants (km)
     * @param fuelEfficiency Vehicle fossil fuel efficiency (L/km)
     * @param emissionsFactor Emissions factor used for vehicle (tCO2/L)
     * @param electricEfficiency Vehicle electric efficiency (kWh/km)
     * @param electricityGenerationEmissions Electricity gen. emissions corresponding to project area (tCO2/kWH)
     * @param electricRange Vehicle electric range (km)
     */
    function setHybrid(
        address[] riders,
        uint256 distance,
        uint256 fuelEfficiency,
        uint256 emissionsFactor,
        uint256 electricEfficiency,
        uint256 electricityGenerationEmissions,
        uint256 electricRange) public { // only owner

        uint256 totalProjectEmissions = EmissionsLib.hybrid(
            distance,
            fuelEfficiency,
            emissionsFactor,
            electricEfficiency,
            electricityGenerationEmissions,
            electricRange);

        for ( uint256 i=0; i<riders.length; i++) {
            emissions[riders[i]] += totalProjectEmissions.div(riders.length);
        }

    }

}
