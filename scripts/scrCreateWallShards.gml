var shardId = argument0;
for( var i = 0; i < 608 - 32; i += 32 ) {
    with( oBlockShardSerializer ) {
        CreateX = 0;
        CreateY = i;
        CreateId = 1;
        event_user( shardId );
                
        CreateX = 768;
        CreateId = 2;
        event_user( shardId );
    }
}
