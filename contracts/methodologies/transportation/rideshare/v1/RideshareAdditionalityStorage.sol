pragma solidity ^0.4.24;

import "./libraries/AdditionalityLib.sol";
import "../../../abstract/ValidityStorage.sol";


/**
 * @title RideshareAdditionalityStorage
 * @dev This contract stores baseline emissions state
 */
contract RideshareAdditionalityStorage is ValidityStorage {

    using FixedPointSafeMath for uint256;

    // TODO: How are investment, technological and instiutional barriers shown?
    /**
    * @dev Updates additionality validity for a project
    * @param project .
    * @param marketShares . 
    */
    function setValidity(
        address project,
        uint256[] marketShares
        ) public {

        validity[project] = AdditionalityLib.dominantMarketExists(
            marketShares
        );

    }


}
