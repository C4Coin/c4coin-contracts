pragma solidity ^0.4.24;


interface IAdditionality {

    function verify(int32[64] data) external returns (bool);

}
