var musId = argument0;

musicT = audio_sound_get_track_position( musId ) * 50;

// Correct the game time if it desyncs from real time.
if( room_speed < 100 ) {
    var deltaT = musicT - t;
    if( abs( deltaT ) > 7 ) {
        // A big lag spike, adjust music to game time.
        audio_sound_set_track_position( musId, t / 50 );
    } else if( deltaT > 0 && scrIsAvoidanceDowntime() ) {
        // Speed up the game to keep up with the music.
        room_speed = 51;
    } else {
        // All is good.
        room_speed = 50;
    }
}

//if( t % 500 == 0 ) {
    //show_debug_message( "Regular update: " + string( t ) + "/" + string( musicT ) );
    //show_debug_message( "Time delta: " + string( delta_time) );
//}

t++;
