var musId = argument0;

t++;
realT += delta_time * 50 / 1000000;
musicT = audio_sound_get_track_position( musId ) * 50;

// Correct the game time if it desyncs from real time.
var shouldCorrectMusic = false;
if( room_speed < 100 ) {
    var deltaT = realT - t;
    if( abs( deltaT ) > 5 ) {
        // A huge lag spike, adjust real time to game time.
        //realT = t;
        //show_debug_message( "Major lag" );
    } else if( abs( deltaT ) > 2 ) {
        // Speed up or slow down the game to keep up with real time.
       // room_speed = 50 + sign( deltaT );
        shouldCorrectMusic = t % 50 == 0;
        //adjustCount++;
        //show_debug_message( "Speed adjusted" + string( adjustCount ) + ": " + string( t ) + "/" + string( realT ) + "/" + string( musicT ) );
    } else {
        // All is good.
        room_speed = 50;
        shouldCorrectMusic = t % 50 == 0;
    }
} else {
    // Speed up mode engaged.
    realT = t;
}

if( t % 500 == 0 ) {
    show_debug_message( "Regular update: " + string( t ) + "/" + string( realT ) + "/" + string( musicT ) );
    show_debug_message( "Tim delta: " + string( delta_time) );
}

// Music correction.
if( shouldCorrectMusic ) {
    if( abs( audio_sound_get_track_position( musId ) * 50 - realT ) > 10 ) {
        audio_sound_set_track_position( musId, realT / 50 );
        show_debug_message( "Music adjusted" );
    }
}
