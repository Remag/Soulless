var trinketId = argument0;

with( oPlayerData.currentTrinket ) {
    instance_destroy();
}
oPlayerData.currentTrinket = instance_create( 0, 0, scrGetTrinketInfoById( trinketId ) );
