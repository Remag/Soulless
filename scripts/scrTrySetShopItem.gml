var itemId = argument0;

if( itemId >= 0 && itemId <= maxUnlockedItem ) {
    scrSelectShopItem( itemId ); 
    return true;
} else {
    return false;
}
