var segmentId = argument0;

if( segmentId >= 0 && segmentId <= pbSegment ) {
    currentSegment = segmentId;
    oPlayerData.lastPracticeSegment = segmentId;
    return true;
} else {
    return false;
}
