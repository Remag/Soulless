if( room != rPracticeChoiceRoom ) {
    var hpToRestore = 0;
    var maxHP = 1;
    switch( scrGetCurrentTrinketType() ) {
        case 2:
            maxHP = 2;
            hpToRestore = 1;
            break;
        case 3:
            maxHP = 3;
            hpToRestore = 1;
            break;
        case 4:
            maxHP = 3;
            hpToRestore = 2;
            break;
    }
    with( objPlayer ) {
        playerPrevHP = playerHP;
        playerHP = min( maxHP, playerHP + hpToRestore );
        if( playerHP != playerPrevHP ) {
            shieldAnimationFrame = 50;
        }
    }
}
