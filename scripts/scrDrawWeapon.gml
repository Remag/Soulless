var weapon = argument0;
var skin = argument1;
var scaleX = argument2;
var alpha = argument3;
var drawOutline = argument4;

var offsetX;
var offsetY;
var weaponSprite;
if( sprite_index == skin.idleSprite ) {
    offsetX = skin.weaponIdleOffsetX;
    offsetY = skin.weaponIdleOffsetsY[image_index];
    weaponSprite = weapon.weaponNormalSprite;
} else if( sprite_index == skin.runSprite ) {
    offsetX = skin.weaponRunOffsetX;
    offsetY = skin.weaponRunOffsetY;
    weaponSprite = weapon.weaponNormalSprite;
} else if( sprite_index == skin.jumpSprite ) {
    offsetX = skin.weaponJumpOffsetX;
    offsetY = skin.weaponJumpOffsetY;
    weaponSprite = weapon.weaponJumpSprite;
} else {
    offsetX = skin.weaponFallOffsetX;
    offsetY = skin.weaponFallOffsetY;
    weaponSprite = weapon.weaponNormalSprite;
}

var weaponIndex;
if( drawOutline ) {
    weaponIndex = 5;
} else {
    weaponIndex = skin.uniqueId;
}

draw_sprite_ext( weaponSprite, weaponIndex, x + offsetX * scaleX, y + offsetY, scaleX, image_yscale, 0, image_blend, alpha );
