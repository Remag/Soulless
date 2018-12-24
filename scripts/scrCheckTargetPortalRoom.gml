if( room == rAvoidanceMainRoom ) {
    if( !instance_exists( objPlayer ) || objAvoidanceController.segment == 1 ) {
        return rPortalRoom;
    } else {
        return -1;
    }
} else if( room == rPracticeActiveRoom ) {
    if( instance_exists( objPlayer ) && instance_exists( oRefundNotification ) ) {
        oPlayerData.currencyCount += oPlayerData.practicePrice;
        return rPracticeChoiceRoom;
    } else if( !instance_exists( objPlayer ) ) {
        return rPracticeChoiceRoom;
    } else {
        return -1;
    }
} else if( room == rPracticeChoiceRoom ) {
    return -1;
} else {
    return rPortalRoom;
}
