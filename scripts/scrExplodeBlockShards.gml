audio_play_sound( sndBoom, 0, false );
with( oBlockShardBase ) {
    if( random_range( 0, 1 ) < 0.04 ) {
        instance_destroy();
    }
    if( BlockId == 0 ) {
        var majorDir = point_direction( 400, 488, x, y );
        direction = majorDir + random_range( -5, 5 );
    } else if( BlockId == 3 ) {
        var majorDir = point_direction( 400, 120, x, y );
        direction = majorDir + random_range( -5, 5 );
    } else if( BlockId == 1 ) {
        var majorDir = point_direction( 150, 304, x, y );
        direction = majorDir + random_range( -5, 5 );
    } else if( BlockId == 2 ) {
    var majorDir = point_direction( 650, 304, x, y );
    direction = majorDir + random_range( -5, 5 );
    }
    speed = random_range( 0.75, 1.5 );
    AngleDelta = random_range( -5, 5 );
}
