if( room == rAvoidanceMainRoom ) {    
    if( !instance_exists( objPlayer ) || objAvoidanceController.segment == 1 ) {
        scrUpdatePersonalBest();
        scrSendDeathToServer();
        scrOnPlayerRestart();
        var targetEntranceId = 0;
        if( global.TournamentMode && global.TournamentTime > global.TournamentLength && !global.TournamentComplete ) {
            global.TournamentComplete = true;
            targetEntranceId = 3;    
        }
        scrChangeRoom( rPortalRoom, targetEntranceId );
    } else if( global.debugMode ) {
        scrRewardPlayerGlobalProgress();
        scrSaveGame();
        var targetEntranceId = 0;
        if( global.TournamentMode && global.TournamentTime > global.TournamentLength && !global.TournamentComplete ) {
            global.TournamentComplete = true;
            targetEntranceId = 3;    
        }
        scrChangeRoom( rPortalRoom, targetEntranceId );
    }
} else if( room == rPracticeActiveRoom ) {
    if( instance_exists( objPlayer ) && instance_exists( oRefundNotification ) ) {
        oPlayerData.currencyCount += oPlayerData.practicePrice;
        scrOnPlayerRestart();
        scrChangeRoom( rPracticeChoiceRoom, 1 );
    } else {
        scrOnPlayerRestart();
        scrChangeRoom( rPracticeChoiceRoom, 1 );
    }
} else if( room != rPracticeChoiceRoom && room != rShopRoom ) {
    scrOnPlayerRestart();
    scrChangeRoom( rPortalRoom, 0 );
}
