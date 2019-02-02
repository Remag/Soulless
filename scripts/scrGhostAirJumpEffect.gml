sprite_index = oPlayerData.currentSkin.jumpSprite;
image_speed = oPlayerData.currentSkin.jumpAnimationSpeed;
audio_play_sound(sndDJump,0,false);
instance_create( x - 2 * xScale, y + 9, oGhostAirJumpCloud );
