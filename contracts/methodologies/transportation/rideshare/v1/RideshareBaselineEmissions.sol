pragma solidity 0.4.24;

import "./EnumVehicleTypes.sol";
import "../../../interfaces/IEmissions.sol";
import "../../../libraries/SignedSafeMath.sol";


contract RideshareBaseline is EnumVehicleTypes, IEmissions {

    using SignedSafeMath for int32;

    enum BaselineParamTypes {
        NumVehicleType,
        DenVehicleType,
        NumDistanceKm,
        DenDistanceKm,
        NumEffLitersPerKm,
        DenEffLitersPerKm,
        NumEmissionsFactMetricTonsCO2PerLiter,
        DenEmissionsFactMetricTonsCO2PerLiter
    }

    function calculate(int32[32] data) external view returns (int32 res) {

        VehicleTypes v = VehicleTypes(data[uint(BaselineParamTypes.NumVehicleType)]);

        if (v == VehicleTypes.FossilFuelVehicle) {
            res = _baselineEmissionsFossilFuel(data);
        } else if (v == VehicleTypes.ElectricVehicle) {
            // res = _baselineEmissionsElectric(data);
            return 0;
        } else if (v == VehicleTypes.HybridVehicle) {
            // res =  _baselineEmissionsHybrid(data);
            return 0;
        } else {
            revert(); // TODO: Restructure this branching
        }

    }

    function _baselineEmissionsFossilFuel(int32[32] data) private pure returns (int32) {

        int32 numDistanceKm = data[uint(BaselineParamTypes.NumDistanceKm)];
        require(numDistanceKm >= 0);
        require(numDistanceKm <= 1000);

        int32 denDistanceKm = data[uint(BaselineParamTypes.DenDistanceKm)];

        int32 numEffLitersPerKm = data[uint(BaselineParamTypes.NumEffLitersPerKm)];
        int32 denEffLitersPerKm = data[uint(BaselineParamTypes.DenEffLitersPerKm)];
        int32 numEmissionsFactMetricTonsCO2PerLiter = data[uint(BaselineParamTypes.NumEmissionsFactMetricTonsCO2PerLiter)];
        int32 denEmissionsFactMetricTonsCO2PerLiter = data[uint(BaselineParamTypes.DenEmissionsFactMetricTonsCO2PerLiter)];

        /* TODO: Validate inputs
        require(_isValidEff(effLitersPerKm));
        require(_isValidEmissionsFact(emissionsFactMetricTonsCO2PerLiter));
        */

        int32 n = numDistanceKm.mul(numEffLitersPerKm).mul(numEmissionsFactMetricTonsCO2PerLiter);
        int32 d = denDistanceKm.mul(denEffLitersPerKm).mul(denEmissionsFactMetricTonsCO2PerLiter);

        return n.div(d);

    }

    function _baselineEmissionsElectric(int32[32] data) private pure returns (int32) {
        // TODO: parse and compute...
        // enum VehicleType PEV Electric
        // Electric efficiency (kWh/km) = W_c
        // Electricity generation GHG emission factor corresponding to project community area
        //    adjusted for transmission loss, if available (tCO2e/kWh)  = GE_p

        return 0;
    }

    function _baselineEmissionsHybrid(int32[32] data) private pure returns (int32) {
        // TODO: parse and compute...
        // enum VehicleType PHEV / Hybrid
        // max(0, D_i-R_c)*V_c*EF_f + min(D_i, R_c)*W_c*GE_p
        // R_c = vehicle all electric range (km)
        // W_c = Vehicle electric efficiency for SOBT vehicle (kWh/km)
        // GE_p = Electricity generation GHG emission factor corresponding to project community area
        //       adjusted for transmission loss, if any (tCO2e/kWh)
        // V_c = Vehicle fossil fuel efficiency for SOBT vehicle  (L/km)
        // EF_f = GHG emission factor of fuel used by vehicle (tCO2e/liter)

        return 0;
    }

}
