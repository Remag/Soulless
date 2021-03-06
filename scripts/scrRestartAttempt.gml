if( room == rAvoidanceMainRoom ) {
    if( global.TournamentMode && global.TournamentTime > global.TournamentLength && !global.TournamentComplete ) {
        global.TournamentComplete = true;
        scrChangeRoom( rPortalRoom, 3 );    
    } else {
        scrChangeRoom( rAvoidanceMainRoom, 0 );
    }
} else if( room == rPracticeChoiceRoom ) {
    scrChangeRoom( rPracticeChoiceRoom, 1 );
} else if( room == rPortalRoom ) {
    scrChangeRoom( rPortalRoom, 0 );
} else if( room == rPracticeActiveRoom ) {
    if( instance_exists( objPlayer ) && instance_exists( oRefundNotification ) ) {
        scrChangeRoom( rPracticeActiveRoom, 0 );
    } else if( oPlayerData.practicePrice <= oPlayerData.currencyCount ) {
        oPlayerData.currencyCount -= oPlayerData.practicePrice;
        oPlayerData.isFirstPracticeAttempt = false;
        scrChangeRoom( rPracticeActiveRoom, 0 );
    } else {
        scrChangeRoom( rPracticeChoiceRoom, 1 );
    }
}
