var shardId = argument0;
for( var i = 0; i < 800 - 32; i += 32 ) {
    with( oBlockShardSerializer ) {
        CreateX = i;
        CreateY = 0;
        CreateId = 3;
        event_user( shardId );
    }
}
