var aCurrentSkin = argument0;

with( oPlayerData.currentSkin ) {
    instance_destroy();
}
oPlayerData.currentSkin = instance_create( 0, 0, scrGetSkinInfoById( aCurrentSkin ) );
