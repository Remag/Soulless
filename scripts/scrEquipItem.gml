var section = argument0;
var item = argument1;

if( section == 0 ) {
    scrSetCurrentSkin( item );
} else if( section == 1 ) {
    scrSetCurrentWeapon( 6 + item );
} else if( section == 2 ) {
    scrSetCurrentTrinket( 12 + item );
}

audio_play_sound( sndMenuSelect, 0, false );
