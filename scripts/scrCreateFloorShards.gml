var shardId = argument0;
for( var i = 0; i < 800 - 32; i += 32 ) {
    with( oBlockShardSerializer ) {
        CreateX = i;
        CreateY = 608 - 32;
        CreateId = 0;
        event_user( shardId );
    }
}
