var section = argument0;
var item = argument1;

if( section == 0 ) {
    return item == oPlayerData.currentSkin.uniqueId;
} else if( section == 1 ) {
    return item + 6 == oPlayerData.currentWeapon.uniqueId;
} else if( section == 2 ) {
    return item + 12 == oPlayerData.currentTrinket.uniqueId;
}
