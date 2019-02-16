var normalSprite = argument0;
var skin = oPlayerData.currentSkin;

if( normalSprite == skin.idleSprite ) {
    return skin.outlineIdleSprite;
} else if( normalSprite == skin.runSprite ) {
    return skin.outlineRunSprite;
} else if( normalSprite == skin.jumpSprite ) {
    return skin.outlineJumpSprite;
} else {
    return skin.outlineFallSprite;
}
