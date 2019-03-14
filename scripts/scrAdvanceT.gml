var musId = argument0;

musicT = audio_sound_get_track_position( musId ) * 50;

// Correct the game time if it desyncs from real time.
if( room_speed < 100 ) {
    var deltaT = musicT - t;
    if( abs( deltaT ) > 5 ) {
        // A huge lag spike, adjust music to game time.
        audio_sound_set_track_position( musId, t / 50 );
    } else if( abs( deltaT ) > 2 ) {
        // Speed up or slow down the game to keep up with the music.
        room_speed = 50 + sign( deltaT );
        adjustCount++;
    } else {
        // All is good.
        room_speed = 50;
    }
}

if( t % 500 == 0 ) {
    show_debug_message( "Regular update: " + string( t ) + "/" + string( musicT ) );
    show_debug_message( "Tim delta: " + string( delta_time) );
}

t++;
