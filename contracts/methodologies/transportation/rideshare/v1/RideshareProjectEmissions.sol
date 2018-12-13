pragma solidity 0.4.24;

import "../../../interfaces/IEmissions.sol";
import "./EnumVehicleTypes.sol";


contract RideshareProjectEmissions is IEmissions {

    function calculate(int64[16] data) external view returns (int64) {
        // uint256 vehicleType,

        // project emissions formula
        // leakage formula
        //
        // running average weekly baseline
        // what would have occured if rideshare not taken, if done solo
        //
        // project emissions
        // Electric d * W_c * GE_p
        // W_c = electric efficiency of vehicle (kWH/km)
        // GE-p = electricity gen. GHG emissions factor in community area p (tCO2e/kWh)
        //
        // FFV - OBDII measurement
        // PE_j_c = FC_j_c * EF_f(c)
        //
        // EF_c = emissions fuel factor tCO2e /liter
        // FC_j_c = measure fuel consumption (cubic feet or natural gas) (liters)
        // if no OBD II is available then use the following formula:
        //
        // PE_j_c = d_j * V_c * EF_f_c
        //
        // V_c =  Vehicle fossil fuel efficiency of a carpool vehicle  (L/km)
        // EF_f_c = GHG emission factor of fuel used by vehicle (tCO2e/L)
        //
        // Hybrid PHEV
        // FC_j_c * EF_f_c + min(dj, max(0, R_c -dd_j_c)) * W_c * GE_p <--
        // dd_j_c cumulative distance traveled
        // R_c vehicle all electric range
        // FC_j_c = measure fuel consumption (L)
        // EF_f_c emissions fuel factor
        //
        // use this formula: p 20
        //
        return 0;
    }

}
