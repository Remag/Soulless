var prevPbSegment = argument0;
var newPbSegment = argument1;

var result = 0;
for( var i = prevPbSegment + 1; i <= newPbSegment; i++ ) {
    var segmentGate = scrGetSegmentGate( i );
    result += scrGetGateSegmentReward( segmentGate ) * 5;
}

return result;
