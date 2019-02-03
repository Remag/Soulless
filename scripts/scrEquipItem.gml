var section = argument0;
var item = argument1;

if( section == 0 ) {
    var skinObject = scrGetSkinInfoById( item );
    with( oPlayerData.currentSkin ) {
        instance_destroy();
    }
    oPlayerData.currentSkin = instance_create( 0, 0, skinObject );
} else if( section == 1 ) {
    var weaponObject = scrGetWeaponInfoById( 6 + item );
    with( oPlayerData.currentWeapon ) {
        instance_destroy();
    }
    oPlayerData.currentWeapon = instance_create( 0, 0, weaponObject );
}
