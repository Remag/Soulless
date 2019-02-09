var skin = argument0;

var sparkCount = instance_number( oLighterSpark );
if( sparkCount < 40 ) {
    var majorDir;
    if( xScale > 0 ) {
        majorDir = random_range( 20, 45 );
    } else {
        majorDir = 180 - random_range( 20, 45 );
    }
    
    // Small sparks.
    repeat( min( 20, ( 40 - sparkCount ) / 2 ) ) {
        var spark = instance_create( x, y - 2, oLighterSpark );

        spark.direction = majorDir;
        spark.speed = random_range( 3, 6 );
        spark.vspeed += vspeed / 2;
        spark.hspeed += hspeed / 2;
        spark.gravity = ( 0.1 + random( 0.2 ) ) * global.grav;
        spark.redComponent = random_range( skin.lighterRedComponentMin, skin.lighterRedComponentMax );
        spark.greenComponent = random_range( skin.lighterGreenComponentMin, skin.lighterGreenComponentMax );
        spark.blueComponent = random_range( skin.lighterBlueComponentMin, skin.lighterBlueComponentMax );
    }
    
    // Flash.
    var flash = instance_create( x, y, oLighterFlash );
    flash.image_blend = skin.lighterFlashColor;
    flash.parentObj = object_index;

    audio_play_sound( choose( sndLighterUse, sndLighterUse2 ), 0, false );
}
