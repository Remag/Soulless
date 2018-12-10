var slotId = argument0;

var fileId = file_text_open_write( "Data\metaInfo" );
file_text_write_real( fileId, slotId );
file_text_close( fileId );
