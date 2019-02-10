var section = argument0;
var item = argument1;

if( !scrIsItemUnlocked( section, item ) ) {
    var unlockId = section * 6 + item;
    var currentPrice = scrGetItemPrice( section, item );
    if( oPlayerData.currencyCount >= currentPrice ) {
        oPlayerData.currencyCount -= currentPrice;
        oPlayerData.itemUnlocks[unlockId] = true;
        scrEquipItem( section, item );
        scrCreateItemChangeParticles( section, oShopViewKid );
    } else {
        return false;
    }
} else if( !scrIsItemEquipped( section, item ) ) {
    scrEquipItem( section, item );
    scrCreateItemChangeParticles( section, oShopViewKid );
}

return true;


