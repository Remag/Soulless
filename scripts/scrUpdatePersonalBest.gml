if( global.pb < objAvoidanceController.t ) {
    global.pb = objAvoidanceController.t;
    global.pb_segment = objAvoidanceController.segment;
    if( global.TournamentMode && !global.TournamentComplete ) {
        global.TournamentPb = global.pb;
        scrSendPbResultsToServer();
    }
}
