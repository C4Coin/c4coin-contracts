pragma solidity ^0.4.24;

import "../../../../libraries/FixedPointSafeMath.sol";


/**
 * @title EmissionsLib
 * @dev This library helps with emissions calculations for different vehicle types
 */
library EmissionsLib {

    using FixedPointSafeMath for uint256;

    /**
     * @dev Calculates emissions given distance and electric vehicle parameters
     * @param distance Distance traveled by vehicle with occupants (km)
     * @param electricEfficiency Vehicle electric efficiency (kWh/km)
     * @param electricityGenerationEmissions Electricity gen. emissions corresponding to project area (tCO2/kWH)
     * @return Emissions produced in ride (tCO2)
     */
     function electric(
         uint256 distance,
         uint256 electricEfficiency,
         uint256 electricityGenerationEmissions
     ) public pure returns (uint256) {

         return distance.mul(electricEfficiency).mul(electricityGenerationEmissions);

     }

     /**
      * @dev Calculates emissions given distance and fossil-fuel parameters
      * @param distance Distance traveled by vehicle with occupants (km)
      * @param fuelEfficiency Vehicle fossil fuel efficiency (L/km)
      * @param emissionsFactor Emissions factor used for vehicle (tCO2/L)
      * @return Emissions produced in ride (tCO2)
      */
     function fossilFuel(
         uint256 distance,
         uint256 fuelEfficiency,
         uint256 emissionsFactor
     ) public pure returns (uint256) {

         return distance.mul(fuelEfficiency).mul(emissionsFactor);

     }

     /**
      * @dev Calculates emissions given distance and fossil-fuel & electric parameters
      * @param distance Distance traveled by vehicle with occupants (km)
      * @param fuelEfficiency Vehicle fossil fuel efficiency (L/km)
      * @param emissionsFactor Emissions factor used for vehicle (tCO2/L)
      * @param electricEfficiency Vehicle electric efficiency (kWh/km)
      * @param electricityGenerationEmissions Electricity gen. emissions corresponding to project area (tCO2/kWH)
      * @param electricRange Vehicle electric range (km)
      * @return Emissions produced in ride (tCO2)
      */
     function hybrid(
         uint256 distance,
         uint256 fuelEfficiency,
         uint256 emissionsFactor,
         uint256 electricEfficiency,
         uint256 electricityGenerationEmissions,
         uint256 electricRange
    ) public pure returns (uint256) {

         uint256 e = 0;
         if (distance > electricRange) {
             e += distance.sub(electricRange).mul(fuelEfficiency).mul(emissionsFactor);
             e += electricRange.mul(electricEfficiency).mul(electricityGenerationEmissions);
         } else {
             e += distance.mul(electricEfficiency).mul(electricityGenerationEmissions);
         }

         return e;
     }

 }
