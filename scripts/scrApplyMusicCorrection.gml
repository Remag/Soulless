var musId = argument0;

if( abs( audio_sound_get_track_position( musId) * 50 - t ) > 10 ) {
    audio_sound_set_track_position( musId, t/50);
}
