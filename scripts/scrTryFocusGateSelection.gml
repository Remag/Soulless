if( maxGate > 1 ) {
    scrClearSegment();
    currentSegment = -1;
    oPlayerData.lastPracticeSegment = -1;
    return true;
} else {
    return false;
}
