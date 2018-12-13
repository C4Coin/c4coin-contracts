pragma solidity ^0.4.24;


interface IAdditionality {

    function verify(int64[16] data) external view returns (bool);

}
