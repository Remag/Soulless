var section = argument0;
var item = argument1;


if( !scrIsItemUnlocked( section, item ) ) {
    scrEquipItem( section, item );
} else if( !scrIsItemEquipped( section, item ) ) {
    scrEquipItem( section, item );
}

return true;


