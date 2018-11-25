//kills the player

if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
{
    if (global.gameStarted) //normal death
    {
        global.deathSound = audio_play_sound(sndDeath,0,false);
        
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
            instance_create(x,y,objBloodEmitter);
            instance_destroy();
        }
        
        if( room == rAvoidanceMainRoom ) {
            // Reward the player and set pbs.
            scrRewardPlayerGlobalProgress();
            if( global.pb < objAvoidanceController.t ) {
                global.pb = objAvoidanceController.t;
                global.pb_segment = objAvoidanceController.segment;
            }
        }
        
        instance_create(0,0,objGameOver);
        
        global.death += 1; //increment deaths
            
        scrSaveGame(); //save death/time
    }
    else    //death in the difficulty select room, restart the room
    {
        with(objPlayer)
            instance_destroy();
            
        room_restart();
    }
}
