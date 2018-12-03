if( room == rAvoidanceMainRoom ) {
    scrChangeRoom( rAvoidanceMainRoom, 0 );
} else if( room == rPracticeChoiceRoom || room == rPracticeActiveRoom ) {
    scrChangeRoom( rPracticeChoiceRoom, 1 );
} else if( room == rPortalRoom ) {
    scrChangeRoom( rPortalRoom, 0 );
}
