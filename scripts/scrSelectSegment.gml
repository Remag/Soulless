var segmentId = argument0;

var price = scrGetSegmentPrice( currentGate, segmentId );
oPracticePriceView.currentPrice = price;
currentSegment = segmentId;
oPlayerData.lastPracticeSegment = segmentId;
