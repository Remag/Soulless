var sectionId = argument0;

if( sectionId >= 0 && sectionId < array_length_1d( sectionNames ) ) {
    currentSection = sectionId;
    maxUnlockedItem = scrGetMaxUnlockedItem( sectionId );
    oPlayerData.lastShopSection = sectionId;
    return true;
} else {
    return false;
}
