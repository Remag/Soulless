var serverData = ds_map_create();
ds_map_add( serverData, "login", oMetaInfo.LastLogin );
ds_map_add( serverData, "gametime", global.TournamentTime );
ds_map_add( serverData, "segment", objAvoidanceController.segment );
ds_map_add( serverData, "avoidtime", objAvoidanceController.t );

var json = json_encode( serverData );
http_post_string( global.api_url + "death/add/", json );
ds_map_destroy( serverData );
