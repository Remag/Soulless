var shieldSprite = argument0;
var shieldFrame = argument1;
var shieldHP = argument2 - 1;
var shieldHPPrev = argument3 - 1;
var shieldXScale = argument4;
var shieldAlpha = argument5;

if( shieldSprite != -1 ) {
    if( shieldHP > shieldHPPrev ) {
        var animIndex = 0;
        var alphaModifier = 1;
        if( shieldFrame < 10 ) {
            alphaModifier = shieldFrame / 10;
            animIndex = 9;
        } else if( shieldFrame < 20 ) {
            animIndex = 9;
        } else if( shieldFrame < 30 ) {
            animIndex = floor( lerp( 9, 19, ( shieldFrame - 20 ) / 10 ) );
        } else {
            animIndex = floor( lerp( 19, 0, ( shieldFrame - 30 ) / 20 ) );
        } 
        if( shieldHPPrev > 0 ) {
            draw_sprite_ext( shieldSprite, 9, x, y, shieldXScale, 1, 0, c_white, shieldAlpha * alphaModifier );
            draw_sprite_ext( shieldSprite, animIndex, x, y, shieldXScale * 1.5, 1.5, 0, c_white, shieldAlpha * alphaModifier );
        } else if( shieldHP > 1 ) {
            draw_sprite_ext( shieldSprite, animIndex, x, y, shieldXScale, 1, 0, c_white, shieldAlpha * alphaModifier );
            draw_sprite_ext( shieldSprite, animIndex, x, y, shieldXScale * 1.5, 1.5, 0, c_white, shieldAlpha * alphaModifier );
        } else {
            draw_sprite_ext( shieldSprite, animIndex, x, y, shieldXScale, 1, 0, c_white, shieldAlpha * alphaModifier );
        }
    } else {
        var animIndex = 0;
        var alphaModifier = 1;
        if( shieldFrame < 10 ) {
            alphaModifier = shieldFrame / 10;
            animIndex = 0;
        } else if( shieldFrame < 20 ) {
            animIndex = floor( lerp( 0, 9, ( shieldFrame - 10 ) / 10 ) );
        } else {
            animIndex = 9;
        }
        if( shieldHP > 0 ) {
            draw_sprite_ext( shieldSprite, 9, x, y, shieldXScale, 1, 0, c_white, shieldAlpha * alphaModifier );
            draw_sprite_ext( shieldSprite, animIndex, x, y, shieldXScale * 1.5, 1.5, 0, c_white, shieldAlpha * alphaModifier );
        } else {
            draw_sprite_ext( shieldSprite, animIndex, x, y, shieldXScale, 1, 0, c_white, shieldAlpha * alphaModifier );
        }
    }
}
