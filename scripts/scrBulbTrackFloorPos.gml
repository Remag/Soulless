if( abs( floorTargetPos - floorCurrentPos ) < 10 ) {
    floorCurrentPos = floorTargetPos;
} else {
    floorCurrentPos += ( floorTargetPos - floorCurrentPos ) * 0.1 + 9 * sign( floorTargetPos - floorCurrentPos );
}
scrBulbDrawFloorPos( floorCurrentPos );
