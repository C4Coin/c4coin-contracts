pragma solidity ^0.4.24;


interface IEmissions {

    function emissionsFossilFuel(
        uint256 D_k,  // Distance driven in km
        uint256 dD_k,
        uint256 EL_k, // Efficiency liters per km
        uint256 dEL_k,
        uint256 EC_l, // Emissions factor metric tons co2 per liter
        uint256 dEC_l
    ) external pure returns (uint256);

    function emissionsElectric(
        uint256 W_c,
        uint256 GE_p
    ) external pure returns (uint256);

    function emissionsHybrid(
        uint256 D_i,
        uint256 R_c,
        uint256 W_c,
        uint256 GE_p,
        uint256 V_c,
        uint256 EF_f
    ) external pure returns (uint256);

}
