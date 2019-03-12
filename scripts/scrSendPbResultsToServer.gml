var serverData = ds_map_create();
ds_map_add( serverData, "login", oMetaInfo.LastLogin );
ds_map_add( serverData, "pb", global.pb );
ds_map_add( serverData, "gametime", global.time );
var json = json_encode( serverData );
http_post_string( global.api_url + "pb/add/", json );
ds_map_destroy( serverData );
