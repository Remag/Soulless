var currentWeaponId = argument0;

with( oPlayerData.currentWeapon ) {
    instance_destroy();
}
oPlayerData.currentWeapon = instance_create( 0, 0, scrGetWeaponInfoById( currentWeaponId ) );
