var gateId = argument0;

if( gateId >= 1 && gateId <= maxGate ) {
    currentGate = gateId;
    segmentCount = scrGetGateSegmentCount( gateId );
    if( maxGate == currentGate && !global.unlockEntirePractice && !global.gameClear ) {
        pbSegment = scrFindLocalSegment( practiceLimitSegment );
    } else {
        pbSegment = segmentCount - 1;
    }
    oPlayerData.lastPracticeGate = gateId;
    return true;
} else {
    return false;
}
