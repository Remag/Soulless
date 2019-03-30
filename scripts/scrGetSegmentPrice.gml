var gateId = argument0;
var segmentId = argument1;

if( global.gameClear || segmentId == -1 ) {
    return 0;
}

switch( gateId ) {
    case 1:
        return 10;
    case 2:
        return 50;
    case 3:
        return 100;
    case 4:
        return 500;
    case 5:
        return 1000;
    case 6:
        return 1000;
    default:
        return 0;
}
