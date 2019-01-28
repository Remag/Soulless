var segment = argument0;

var result = 0;
for( var i = 2; i <= segment; i++ ) {
    var segmentGate = scrGetSegmentGate( i );
    result += scrGetGateSegmentReward( segmentGate );
}

return result;
