var segment = objAvoidanceController.segment;
var pbSegment = global.pb_segment;

var gate = scrGetSegmentGate( pbSegment ); 
var pbGate = scrGetSegmentGate( pbSegment );

var payoutCount = 0;
// General payout.
if( segment > 1 ) {
    payoutCount += gate * 100;
}

// Attack PB.
if( segment > pbSegment ) {
    for( var i = pbSegment + 1; i <= segment; i++ ) {
        var segmentGate = scrGetSegmentGate( i );
        payoutCount += segmentGate * 300;
    }
}

// Gate PB.
if( gate > pbGate ) {
    for( var i = pbGate + 1; i <= gate; i++ ) {
        payoutCount += i * 1000;
    }
}

oPlayerData.currencyCount += payoutCount;



