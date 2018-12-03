if( maxGate > 1 ) {
    scrClearSegment();
    currentSegment = -1;
    oPlayerData.lastPracticeSegment = -1;
    oPracticePriceView.currentPrice = 0;
    return true;
} else {
    return false;
}
