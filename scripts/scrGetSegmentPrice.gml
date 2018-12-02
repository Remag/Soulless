var gateId = argument0;
var segmentId = argument1;

if( segmentId == -1 ) {
    return 0;
}

switch( gateId ) {
    case 1:
        return 100;
    case 2:
        return 200;
    case 3:
        return 300;
    case 4:
        return 400;
    case 5:
        return 500;
    case 6:
        return 0;
    default:
        return 0;
}
