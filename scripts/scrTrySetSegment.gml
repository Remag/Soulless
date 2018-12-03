var segmentId = argument0;

if( segmentId >= 0 && segmentId <= pbSegment ) {
    scrClearSegment( currentSegment );
    scrSelectSegment( segmentId );
    return true;
} else {
    return false;
}
