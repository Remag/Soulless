var segment = objAvoidanceController.segment;
var pbSegment = global.pb_segment;

var payoutCount = 0;
// General payout.
payoutCount += scrGetTotalAttackReward( segment );
// Attack PB.
payoutCount += scrGetTotalPbReward( pbSegment, segment );
// Gate PB.
payoutCount += scrGetTotalGateReward( pbSegment, segment );

oPlayerData.currencyCount += payoutCount;

// Set new pb segments.
if( global.pb < objAvoidanceController.t ) {
    global.pb = objAvoidanceController.t;
    global.pb_segment = objAvoidanceController.segment;
}
