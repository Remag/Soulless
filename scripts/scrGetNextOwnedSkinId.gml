var skin = argument0;

var currentId = skin.uniqueId;
while( true ) {
    currentId = currentId + 1;
    if( currentId >= 6 ) {
        currentId = 0;
    }
    if( scrIsItemUnlocked( 0, currentId ) ) {
        break;
    }
}
return currentId;
