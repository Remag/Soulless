var globalSegment = argument0;

var result = globalSegment;
for( var i = 1; i <= 6; i++ ) {
    var localCount = scrGetGateSegmentCount( i );
    if( result <= localCount ) {
        return result - 1;
    }
    result -= localCount;
}

return 0;
