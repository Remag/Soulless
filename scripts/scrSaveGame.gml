///scrSaveGame()
///saves the game

//create a map for save data
var saveMap = ds_map_create();

ds_map_add( saveMap, "death", global.death );
ds_map_add( saveMap, "time", global.time );
ds_map_add( saveMap, "timeMicro", global.timeMicro );

ds_map_add( saveMap, "pb", global.pb );
ds_map_add( saveMap, "pb_segment", global.pb_segment );
ds_map_add( saveMap, "currencyCount", oPlayerData.currencyCount );

ds_map_add( saveMap, "currentSkin", oPlayerData.currentSkin.uniqueId );
var vItemCount = array_length_1d( oPlayerData.itemUnlocks );
for( var i = 0; i < vItemCount; i++ ) {
    ds_map_add( saveMap, "item" + string( i ), oPlayerData.itemUnlocks[i] );
}

ds_map_add( saveMap, "saveGameClear", global.gameClear);

//add md5 hash to verify saves and make them harder to hack
ds_map_add( saveMap, "mapMd5", md5_string_unicode(json_encode(saveMap)+global.md5StrAdd) );

//save the map to a file
//open the save file
var f = file_text_open_write( "Data\save" + string(global.savenum) );
    
//write map to the save file with base64 encoding
file_text_write_string( f, base64_encode(json_encode(saveMap)) );
    
file_text_close( f );

//destroy the map
ds_map_destroy( saveMap );
