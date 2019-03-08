//kills the player
if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
{
    if (global.gameStarted) //normal death
    {     
        var needKillPlayer = true;
        var wasHitRegistered = false;
        with( objPlayer ) {
            if( invulFrames == 0 ) {
                needKillPlayer = playerHP <= 1;
                playerHP--;
                invulFrames = 50;
                wasHitRegistered = true;
            } else {
                needKillPlayer = false;
                wasHitRegistered = false;
            }
        }
        
        if( !needKillPlayer && wasHitRegistered ) {
            global.deathSound = audio_play_sound( sndGhostDeath, 0, false );
        }  
         
        if( needKillPlayer ) {
            if (!global.muteMusic)  //play death music
            {
                if (global.deathMusicMode == 1) //instantly pause the current music
                {
                    audio_pause_sound(global.currentMusic);
                }
                else if (global.deathMusicMode == 2)    //fade out the current music
                {                
                    with (objWorld)
                        event_user(0);  //fades out and stops the current music
                }
            }
            
            with (objPlayer)
            {
                var controller = instance_create(x,y,oPlayerData.currentSkin.deathController);
                controller.image_xscale = xScale;
                instance_destroy();
            }
            
            instance_create(0,0,oGameOverController);
            
            global.death += 1; //increment deaths
                
            scrSaveGame(); //save death/time
        }
    }
    else    //death in the difficulty select room, restart the room
    {
        with(objPlayer)
            instance_destroy();
            
        room_restart();
    }
}
