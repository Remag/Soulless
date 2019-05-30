var section = argument0;

var pbGate = scrGetSegmentGate( global.pb_segment );

if( section == 0 ) {
    if( pbGate < 6 ) {
        return pbGate - 1;
    } else if( global.gameClear ) {
        return 5;
    } else {
        return 4;
    }
} else if( section == 2 ) {
    if( pbGate < 6 ) {
        return pbGate - 1;
    } else if( global.hpGameClear ) {
        return 5;
    } else {
        return 4;
    }
} else {
    return pbGate - 1;
}
