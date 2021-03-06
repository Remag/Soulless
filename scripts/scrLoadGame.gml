///scrLoadGame(loadfile)
///loads the game
///argument0 - sets whether or not to read the save file when loading the game

var loadFile = argument0;

//only load save data from the save file if the script is currently set to (we should only need to load these on first load because the game stores them afterwards)
if (loadFile)
{
    //load the save map
    var saveMap;
    
    var f = file_text_open_read("Data\save"+string(global.savenum));
    saveMap = json_decode(base64_decode(file_text_read_string(f)));
       
    file_text_close(f);
    
    var saveValid = true;   //keeps track of whether or not the save being loaded is valid
    
    if (saveMap != -1)  //check if the save map loaded correctly
    {
        global.death = ds_map_find_value(saveMap,"death");
        global.time = ds_map_find_value(saveMap,"time");
        global.timeMicro = ds_map_find_value(saveMap,"timeMicro");
        global.TournamentTime = ds_map_find_value(saveMap,"tournamentTime");
        global.TournamentTimeMicro = ds_map_find_value(saveMap,"tournamentTimeMicro");
        if( is_undefined( global.TournamentTime ) ) {
            global.TournamentTime = 0;
            global.TournamentTimeMicro = 0;
        }
        global.TournamentPb = ds_map_find_value( saveMap, "tournamentPb" );
        if( is_undefined( global.TournamentPb ) ) {
            global.TournamentPb = 0;
        }
        global.TournamentSegmentPb = ds_map_find_value( saveMap, "tournamentSegmentPb" );
        global.TournamentGameClear = ds_map_find_value( saveMap, "tournamentGameClear" );
        if( is_undefined( global.TournamentGameClear ) ) {
            global.TournamentGameClear = false;
            global.TournamentSegmentPb = 0;
        }
        global.TournamentComplete = global.TournamentTime > global.TournamentLength;


        global.gameClear = ds_map_find_value(saveMap,"saveGameClear");
        global.hpGameClear = ds_map_find_value(saveMap,"saveHpGameClear");
        if( is_undefined( global.hpGameClear ) ) {
            global.hpGameClear = global.gameClear;
        }
        
        //load md5 string from the save map
        var mapMd5 = ds_map_find_value(saveMap,"mapMd5");
        
        //check if md5 is not a string in case the save was messed with or got corrupted
        if (!is_string(mapMd5))
            mapMd5 = "";   //make it a string for the md5 comparison
        
        //generate md5 string to compare with
        ds_map_delete(saveMap,"mapMd5");
        var genMd5 = md5_string_unicode(json_encode(saveMap)+global.md5StrAdd);
     
        // Disable the hash check to not corrupt saves with version changes ( for now? ).   
//        if (mapMd5 != genMd5)   //check if md5 hash is invalid
//            saveValid = false;
            
        global.pb = ds_map_find_value(saveMap,"pb");
        global.pb_segment = ds_map_find_value(saveMap,"pb_segment");
        oPlayerData.currencyCount = ds_map_find_value(saveMap,"currencyCount");
        oCurrencyDisplayController.displayedCurrency = oPlayerData.currencyCount;
        
        // Skin info.
        var vCurrentSkinId = ds_map_find_value( saveMap, "currentSkin" );
        if( !is_undefined( vCurrentSkinId ) ) {
            scrSetCurrentSkin( vCurrentSkinId );
        }
        var vCurrentWeaponId = ds_map_find_value( saveMap, "currentWeapon" );
        if( !is_undefined( vCurrentWeaponId ) ) {
            scrSetCurrentWeapon( vCurrentWeaponId );
        }
        var vCurrentTrinketId = ds_map_find_value( saveMap, "currentTrinket" );
        if( !is_undefined( vCurrentTrinketId ) ) {
            scrSetCurrentTrinket( vCurrentTrinketId );
        }
        var vItemCount = array_length_1d( oPlayerData.itemUnlocks );
        for( var i = 0; i < vItemCount; i++ ) {
            var vCurrentUnlockedItemStatus = ds_map_find_value( saveMap, "item" + string( i ) );
            if( !is_undefined( vCurrentUnlockedItemStatus ) ) {
                oPlayerData.itemUnlocks[i] = vCurrentUnlockedItemStatus;
            }
        }
        oPlayerData.itemUnlocks[vCurrentSkinId] = true;
        oPlayerData.itemUnlocks[vCurrentWeaponId] = true;
        oPlayerData.itemUnlocks[vCurrentTrinketId] = true;
        if( global.gameClear ) {
            scrUnlockAllItems();
        }
        
        //destroy the map
        ds_map_destroy(saveMap);
    }
    else
    {
        //save map didn't load correctly, set the save to invalid
        saveValid = false;
    }
    
    if (!saveValid) //check if the save is invalid
    {
        //save is invalid, restart the game
        
        show_message("Save invalid!");
        
        scrRestartGame();
        
        exit;
    }
}

//set game variables and set the player's position

global.gameStarted = true;  //sets game in progress (enables saving, restarting, etc.)
global.noPause = false;     //disable no pause mode
global.autosave = false;    //disable autosaving since we're loading the game
global.grav = 1;
oPlayerData.targetEntranceId = 0;

room_goto( rPortalRoom );
