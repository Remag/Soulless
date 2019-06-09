if( global.pb < objAvoidanceController.t ) {
    global.pb = objAvoidanceController.t;
    global.pb_segment = objAvoidanceController.segment;
    if( global.TournamentMode && !global.TournamentComplete ) {
        global.TournamentPb = global.pb;
        global.TournamentSegmentPb = global.pb_segment;
        scrSendPbResultsToServer();
    }
}

if( global.session_pb < objAvoidanceController.t ) {
    global.session_pb = objAvoidanceController.t;    
}
