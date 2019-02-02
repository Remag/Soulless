var skinId = argument0;

if( 0 == skinId ) {
    return oKidSkinInfo;
} else if( 1 == skinId ) {
    return oGhostSkinInfo;
} else if( 2 == skinId ) {
    return oWhiteSkinInfo;
} else if( 3 == skinId ) {
    return oOutlineSkinInfo;
} else {
    return oKidSkinInfo;
}
