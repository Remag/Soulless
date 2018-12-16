if( !file_exists( "Data\metaInfo" ) ) {
    return 0;
}

var fileId = file_text_open_read( "Data\metaInfo" );
var result = file_text_read_real( fileId );
file_text_close( fileId );
return result;
