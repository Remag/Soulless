//stop death sound/music
audio_stop_sound(global.deathSound);
audio_stop_sound(global.gameOverMusic);
            
//resume room music
audio_resume_sound(global.currentMusic);
            
//return to old gain if music is being faded out
if (global.musicFading) {
    global.musicFading = false;
    audio_sound_gain(global.currentMusic,global.currentGain,0);
    alarm[0] = -1;   //reset alarm that pauses music
}         
scrSaveGame(); //save death/time

