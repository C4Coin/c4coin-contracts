pragma solidity ^0.4.24;


contract EnumVehicleTypes {
    enum VehicleTypes {
        FossilFuelVehicle,
        ElectricVehicle,
        HybridVehicle
    }

    modifier isValidVehicleType(uint256 v) {
        require(VehicleTypes(v) <= VehicleTypes.HybridVehicle);
        _;
    }
}
