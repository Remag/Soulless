var section = argument0;

var pbGate = scrGetSegmentGate( global.pb_segment );
//return pbGate - 1;
if( section == 0 ) {
    return 3;
} else {
    return 2;
}
