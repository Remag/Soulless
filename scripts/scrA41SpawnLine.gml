///scrA41SpawnLine(variant,centerX,countMultiplier)
///argument0 - attack variant
///argument1 - rotation center x
///argument2 - spheres count multiplier;

var variant = argument0;
var spawnCenterX = argument1;
var countMultiplier = argument2;

switch( variant ) {
    case 0: {
        // constant speed, constant distance, various count.
        var count = ceil( irandom_range( 8, 15 ) * countMultiplier );
        var step = ( 1000 - 32 ) / count;
        var offset = random( step );
        for( var i = 0; i < count; i++ ) {
            var spawnY = 608 - 32 - i * step - offset;
            var obj = instance_create( spawnCenterX, spawnY, objAlgA41Sphere );
            obj.centerX = spawnCenterX;
            if( spawnCenterX < 400 ) {
               obj.direction = 0;
            } else {
                obj.direction = 180;
            }
            obj.speed = ( 608 - obj.y ) / 50;
            obj.image_blend = make_color_hsv( 85, 255, 255 );
        }
        break;
    }
    case 1: {
        // constant speed, various distance, constant count.
        var count = ceil( 12 * countMultiplier );
        var step = ( 1000 - 32 ) / count;
        for( var i = 0; i < count; i++ ) {
            var spawnY = 608 - 32 - random_range( i * step, ( i + 1 ) * step );
            var obj = instance_create( spawnCenterX, spawnY, objAlgA41Sphere );
            obj.centerX = spawnCenterX;
            if( spawnCenterX < 400 ) {
               obj.direction = 0;
            } else {
                obj.direction = 180;
            }
            obj.speed = ( 608 - obj.y ) / 50;
            obj.image_blend = make_color_hsv( 155, 255, 255 );
        }
        break;
    }
    case 2: {
        // various speed, constant distance, constant count.
        var count = ceil( 15 * countMultiplier );
        var step = ( 1000 - 32 ) / count;
        var offset = random( step );
        for( var i = 0; i < count; i++ ) {
            var spawnY = 608 - 32 - i * step - offset;
            var obj = instance_create( spawnCenterX, spawnY, objAlgA41Sphere );
            obj.centerX = spawnCenterX;
            if( spawnCenterX < 400 ) {
               obj.direction = 0;
            } else {
                obj.direction = 180;
            }
            obj.speed = ( 608 - obj.y ) / random_range( 40, 80 );
            obj.image_blend = make_color_hsv( 15, 255, 255 );
        }
        break;
    }
}
