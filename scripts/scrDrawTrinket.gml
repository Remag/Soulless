var trinketInfo = argument0;
var trinketXScale = argument1;
var trinketAlpha = argument2;

if( trinketInfo.trinketSprite != -1 ) {
    draw_sprite_ext( trinketInfo.trinketSprite, 0, x, y, trinketXScale, 1, 0, c_white, trinketAlpha );
}
