var segment = argument0;

for( var i = 1; i <= 6; i++ ) {
    var count = scrGetGateSegmentCount( i );
    if( segment <= count ) {
        return i;
    }
    segment -= count;
}

return -1;
