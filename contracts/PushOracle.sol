// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;
import "./ISupraSValueFeed.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract PushOracle is  Ownable {

ISupraSValueFeed internal sValueFeed;


constructor(ISupraSValueFeed _sValueFeed) Ownable(msg.sender){
sValueFeed=_sValueFeed;

}


function updateSupraSvalueFeed(ISupraSValueFeed _newSValueFeed)
external
onlyOwner
 {


sValueFeed = _newSValueFeed;
}


function getSupraSvalueFeed() external view returns(ISupraSValueFeed){
return sValueFeed;
}


function getPrice(uint256 _priceIndex)
external
view
returns (ISupraSValueFeed.priceFeed memory) {
return sValueFeed.getSvalue(_priceIndex);
}


function getPriceForMultiplePair(uint256[] memory _pairIndexes)
external
view
returns (ISupraSValueFeed.priceFeed[] memory) {
return sValueFeed.getSvalues(_pairIndexes);
}

function getDerivedValueOfPair(uint256 pair_id_1,uint256 pair_id_2,uint256 operation)
external
view
returns(ISupraSValueFeed.derivedData memory){
return sValueFeed.getDerivedSvalue(pair_id_1,pair_id_2,operation);
}
}