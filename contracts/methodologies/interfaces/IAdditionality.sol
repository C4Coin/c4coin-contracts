pragma solidity ^0.4.24;


interface IAdditionality {

    function verify(int32[32] data) external view returns (bool);

}
