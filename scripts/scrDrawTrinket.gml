var trinketInfo = argument0;
var trinketXScale = argument1;
var trinketAlpha = argument2;
var playerHp = argument3;

if( trinketInfo.trinketHasSprite ) {
    var hp = min( 3, playerHp );
    draw_sprite_ext( trinketInfo.trinketSprites[hp], 0, x, y, trinketXScale, 1, 0, c_white, trinketAlpha );
}
