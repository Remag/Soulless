///scrTargetCircle(framesToTarget,modifier,color,obj)
///spawns a line of projectiles
///argument2 - frames to target
///argument3 - distance modifier
///argument4 - image blend
///argument5 - projectile to spawn

var framesToTarget = argument0;
var modifier = argument1;
var color = argument2;
var spawnObj = argument3;

var distance = 32 * modifier;
var accel = distance * 2 / framesToTarget / framesToTarget;
var spawnNum = max( ceil( 40 * modifier ), 20 );
var circle = scrMakeLine( 0, 608, 800, 608, spawnNum, spawnObj );
for( var i = 0; i < array_length_1d( circle ); ++i ) {
    circle[i].speed = accel * framesToTarget;
    circle[i].direction = 90;
    circle[i].gravity = accel;
    circle[i].gravity_direction = circle[i].direction + 180;
    circle[i].image_blend = color;
}
return circle;
