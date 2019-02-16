var section = argument0;

var pbGate = scrGetSegmentGate( global.pb_segment );

if( section == 0 ) {
    return 5;
    if( pbGate < 6 ) {
        return pbGate - 1;
    } else if( global.gameClear ) {
        return 5;
    } else {
        return 4;
    }
} else {
    return 3;
}
