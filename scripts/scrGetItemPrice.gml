var sectionId = argument0;
var itemId = argument1;

if( itemId == -1 ) {
    return 0;
}

switch( itemId ) {
    case 0:
        return 0;
    case 1:
        return 5000;
    case 2:
        return 10000;
    case 3:
        return 25000;
    case 4:
        return 50000;
    case 5:
        return 100000;
    default:
        return 0;
}
