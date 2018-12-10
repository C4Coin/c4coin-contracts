pragma solidity 0.4.24;


contract BaseEmissions {

    function baseline(bytes32 data) public pure returns (uint256);

    function project(bytes32 data) public pure returns (uint256);

    function leakage(bytes32 data) public pure returns (uint256);

    function emissions(bytes32 data) public view returns (uint256) {
        uint256 b = baseline(data);
        uint256 p = project(data);
        uint256 l = leakage(data);

        require(b > p);
        require(p > l);

        return b - p - l; // SafeMath here
    }
}
