if( abs( wallTargetPos - wallCurrentPos ) < 10 ) {
    wallCurrentPos = wallTargetPos;
} else {
    wallCurrentPos += ( wallTargetPos - wallCurrentPos ) * 0.1 + 9 * sign( wallTargetPos - wallCurrentPos );
}
scrBulbDrawWallPos( wallCurrentPos );
