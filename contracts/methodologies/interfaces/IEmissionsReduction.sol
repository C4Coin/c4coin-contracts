pragma solidity ^0.4.24;


// This may be near max stack size... here be dragons.
// Max seems to be 256 * 17 ~= 4352...
// This interface requires 32 * 32 *4 ~= 4096 .. the Solidity Gods will have their vengance...
// See https://github.com/ethereum/solidity/blob/develop/libsolidity/codegen/ContractCompiler.cpp
// Notice that (stackLayout.size() > 17 -> Stack too deep, try removing local variables
interface IEmissionsReduction {

    function calculate(
        int32[32] additionalityData,
        int32[32] baselineData,
        int32[32] projectData,
        int32[32] leakageData)
        external view returns (int32);

}
