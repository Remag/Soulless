///initializes all global variables needed for the game

scrSetGlobalOptions();       //initialize global game options

global.savenum = 1;
global.difficulty = 0;  //0 = medium, 1 = hard, 2 = very hard, 3 = impossible
global.death = 0;
global.time = 0;
global.timeMicro = 0;
global.saveRoom = "";
global.savePlayerX = 0;
global.savePlayerY = 0;
global.grav = 1;
global.saveGrav = 1;

global.hardMode = false; //Debug

for (var i = global.secretItemTotal-1; i >= 0; i--)
{
    global.secretItem[i] = false;
    global.saveSecretItem[i] = false;
}

for (var i = global.bossItemTotal-1; i >= 0; i--)
{
    global.bossItem[i] = false;
    global.saveBossItem[i] = false;
}

global.gameClear = false;
global.hpGameClear = false;
global.saveGameClear = false;

for (var i = 99; i >= 0; i--)
{
    global.trigger[i] = false;
}

global.gameStarted = false;     //determines whether the game is in progress (enables saving, restarting, etc.)
global.noPause = false;         //sets whether or not to allow pausing (useful for bosses to prevent desync)
global.autosave = false;        //keeps track of whether or not to autosave the next time the player is created
global.noDeath = false;         //keeps track of whether to give the player god mode
global.infJump = false;         //keeps track of whether to give the player infinite jump

global.gamePaused = false;      //keeps track of whether the game is paused or not
global.pauseSurf = -1;       //stores the screen surface when the game is paused
global.pauseDelay = 0;      //sets pause delay so that the player can't quickly pause buffer

global.currentMusicID = -1;  //keeps track of what song the current music is
global.currentMusic = -1;    //keeps track of current main music instance
global.deathSound = -1;     //keeps track of death sound when the player dies
global.gameOverMusic = -1;   //keeps track of game over music instance
global.musicFading = false;     //keeps track of whether the music is being currently faded out
global.currentGain = 0;     //keeps track of current track gain when a song is being faded out

global.menuSelectPrev[0] = 0;     //keeps track of the previously selected option when navigating away from the difficulty menu
global.menuSelectPrev[1] = 0;     //keeps track of the previously selected option when navigating away from the options menu

//get the default window size
global.windowWidth = surface_get_width(application_surface);
global.windowHeight = surface_get_height(application_surface);

//keeps track of previous window position/size when display_reset is used for setting vsync
global.windowXPrev = 0;
global.windowYPrev = 0;
global.windowWidthPrev = 0;
global.windowHeightPrev = 0;

display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface));  //set the correct gui size for the Draw GUI event

global.controllerMode = false;  //keeps track of whether to use keyboard or controller
global.controllerDelay = -1;    //handles delay between switching between keyboard/controller so that the player can't use both at the same time

global.segment = 0;

global.start_time = 0;
global.track_ver = 0;

global.playeralive = 0;

global.pb = 0;
global.pb_segment = 1;
global.session_pb = 0;
global.session_pb_segment = 1;
global.unlockEntirePractice = false;

global.StartSegment = 0;
global.TournamentTime = 0;
global.TournamentTimeMicro = 0;
global.TournamentLength = 4 * 3600;
global.TournamentPb = 0;
global.TournamentSegmentPb = 0;
global.TournamentGameClear = false;
global.TournamentComplete = false;

global.s33RainbowRadius[0] = 13;
global.s33RainbowRadius[1] = 18;
global.s33RainbowRadius[2] = 23;
global.s33RainbowRadius[3] = 28;
global.s33RainbowRadius[4] = 33;
global.s33RainbowRadius[5] = 38;
global.s33RainbowRadius[6] = 42;
global.s33RainbowRadius[7] = 46;
global.s33RainbowRadius[8] = 49;
global.s33RainbowRadius[9] = 50;
global.s33RainbowRadius[10] = 51;
global.s33RainbowRadius[11] = 52;
global.s33RainbowRadius[12] = 53;
global.s33RainbowRadius[13] = 53;
global.s33RainbowRadius[14] = 53;
global.s33RainbowRadius[15] = 48;
global.s33RainbowRadius[16] = 46;
global.s33RainbowRadius[17] = 43;
global.s33RainbowRadius[18] = 38;
global.s33RainbowRadius[19] = 32;

global.currentAttemptNumber = 0;
scrWriteDsValue( 0 );

randomize();    //make sure the game starts with a random seed for RNG
