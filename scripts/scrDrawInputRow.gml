var columnX = argument0;
var rowIndex = argument1;
var keyIndex = argument2;
var offsetFire = argument3;

var keyX = x + columnX + keyOffsetX;
var rowY = y + rowIndex * ySeparation + 32 + columnOffsetY;
draw_set_halign(fa_left);
draw_text( x + columnX, rowY, strSelect[keyIndex] );
    
draw_set_halign(fa_right);
    
if( keyIndex == select ) {
    texture_set_interpolation( true );
    var fireX = x + columnX - 10;
    if( offsetFire ) {
        fireX += 194;
    }
    draw_sprite( sprSoulFire, animationIndex, fireX, y + rowIndex * ySeparation + 18 + fireOffset );
    texture_set_interpolation( false );
    
    if (settingKey && animationStep % 46 < 23 ) { // key prompt
        draw_text( keyX, rowY, "???" );
    }
}
    
if( !settingKey || keyIndex != select ) {   // shows current key
    draw_text( keyX, rowY, strKey[keyIndex] );
}
