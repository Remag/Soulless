var gateId = argument0;

if( gateId >= 1 && gateId <= maxGate ) {
    currentGate = gateId;
    segmentCount = scrGetGateSegmentCount( gateId );
    pbSegment = segmentCount - 1;
    oPlayerData.lastPracticeGate = gateId;
    return true;
} else {
    return false;
}
