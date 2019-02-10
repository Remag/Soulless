var skin = argument0;

var nextSkinId = scrGetNextOwnedSkinId( skin );
scrSetCurrentSkin( nextSkinId );
audio_play_sound( sndMenuSelect, 0, false );
scrCreateItemChangeParticles( 0, object_index );
