var segmentId = argument0;

if( segmentId >= 0 && segmentId <= pbSegment ) {
    scrClearSegment( currentSegment );
    currentSegment = segmentId;
    oPlayerData.lastPracticeSegment = segmentId;
    return true;
} else {
    return false;
}
