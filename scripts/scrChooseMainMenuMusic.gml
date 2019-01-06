var slotId = scrLoadLastSlot();
var saveSlotName = "Data\save" + string( slotId + 1 );

if( !file_exists( saveSlotName ) ) {
    return 'music/musMenu1.ogg'
}

var f = file_text_open_read( saveSlotName );
var saveMap = json_decode( base64_decode( file_text_read_string( f ) ) );            
file_text_close( f );

var pbSegment = ds_map_find_value( saveMap, "pb_segment" );
if( is_undefined( pbSegment ) ) {
    return 'music/musMenu1.ogg'
}

var pbGate = scrGetSegmentGate( pbSegment );
switch( pbGate ) {
    case 1:
        return 'music/musMenu1.ogg'
    case 2:
        return 'music/musMenu2.ogg'
    case 3:
        return 'music/musMenu3.ogg'
    case 4:
        return 'music/musMenu4.ogg'
    case 5:
        return 'music/musMenu5.ogg'
    case 6:
        return 'music/musMenu5.ogg'
    default:
        return 'music/musMenu1.ogg'
}

