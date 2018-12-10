pragma solidity 0.4.24;


contract BaseEmissions {

    function baseline(bytes32 data) public pure returns (uint256);

    function project(bytes32 data) public pure returns (uint256);

    function leakage(bytes32 data) public pure returns (uint256);

    function offset(bytes32 baselineData, bytes32 projectData, bytes32 leakageData) public view returns (uint256) {
        uint256 b = baseline(baselineData);
        uint256 p = project(projectData);
        uint256 l = leakage(leakageData);

        require(b > p);
        require(p > l);

        return b - p - l; // SafeMath here
    }

}
