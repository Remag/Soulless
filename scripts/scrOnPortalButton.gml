if( room == rAvoidanceMainRoom ) {
    if( !instance_exists( objPlayer ) || objAvoidanceController.segment == 1 ) {
        scrOnPlayerRestart();
        scrChangeRoom( rPortalRoom, 0 );
    }
} else if( room == rPracticeActiveRoom ) {
    if( instance_exists( objPlayer ) && instance_exists( oRefundNotification ) ) {
        oPlayerData.currencyCount += oPlayerData.practicePrice;
        scrOnPlayerRestart();
        scrChangeRoom( rPracticeChoiceRoom, 1 );
    } else if( !instance_exists( objPlayer ) ) {
        scrOnPlayerRestart();
        scrChangeRoom( rPracticeChoiceRoom, 1 );
    }
} else if( room != rPracticeChoiceRoom ) {
    scrOnPlayerRestart();
    scrChangeRoom( rPortalRoom, 0 );
}