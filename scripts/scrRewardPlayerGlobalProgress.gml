var segment = objAvoidanceController.segment;
var pbSegment = global.pb_segment;

var gate = scrGetSegmentGate( segment ); 
var pbGate = scrGetSegmentGate( pbSegment );

var payoutCount = 0;
// General payout.
for( var i = 2; i <= segment; i++ ) {
    var segmentGate = scrGetSegmentGate( i );
    payoutCount += scrGetGateSegmentReward( segmentGate );
}

// Attack PB.
if( segment > pbSegment ) {
    for( var i = pbSegment + 1; i <= segment; i++ ) {
        var segmentGate = scrGetSegmentGate( i );
        payoutCount += scrGetGateSegmentReward( segmentGate ) * 5;
    }
}

// Gate PB.
if( gate > pbGate ) {
    for( var i = pbGate; i < gate; i++ ) {
        payoutCount += scrGetGateOpenReward( i );
    }
}

oPlayerData.currencyCount += payoutCount;

// Set new pb segments.
if( global.pb < objAvoidanceController.t ) {
    global.pb = objAvoidanceController.t;
    global.pb_segment = objAvoidanceController.segment;
}
