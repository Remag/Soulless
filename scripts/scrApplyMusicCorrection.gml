var musId = argument0;
show_debug_message( string( abs( audio_sound_get_track_position( musId ) * 50 - t ) ) );

if( abs( audio_sound_get_track_position( musId ) * 50 - t ) > 10 ) {
    audio_sound_set_track_position( musId, t / 50 );
    if( room_speed < 100 ) {
        room_speed = 50;
    }
} else if( abs( audio_sound_get_track_position( musId ) * 50 - t ) > 2 ) {
    if( room_speed < 100 ) {
        room_speed = 50 + sign( audio_sound_get_track_position( musId ) * 50 - t );
    }
} else {
    if( room_speed < 100 ) {
        room_speed = 50;
    }
}
