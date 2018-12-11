import "tidbit-eth/contracts/PushOracles/IOracleConsumer.sol";


contract RideshareOracleConsumer is IOracleConsumer {
    bytes32 public id;
    bytes public result;

    function receiveResult(bytes32 _id, bytes _result) external {
        // require id in oracle white list
        result = _result; // change this to a mapping? id -> array of results
        // just have it call mint directly or queue? queue seems safter but who triggers mint?
        // claim1, claim2, ... claimN....
        // then engine triggers mintAll()? 
    }
}
