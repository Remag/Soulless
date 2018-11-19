///scrTargetCircle(x,y,framesToTarget,modifier,color,obj)
///spawns a ring of projectiles
///argument0 - spawn X
///argument1 - spawn Y
///argument2 - frames to target
///argument3 - distance modifier
///argument4 - image blend
///argument5 - projectile to spawn

var spawnX = argument0;
var spawnY = argument1;
var framesToTarget = argument2;
var modifier = argument3;
var color = argument4;
var spawnObj = argument5;

var distance = ( point_distance( spawnX, spawnY, scrGetPlayerX(), scrGetPlayerY() ) + 10 ) * modifier;
var circleAngle = point_direction( spawnX, spawnY, scrGetPlayerX(), scrGetPlayerY() );
var accel = distance * 2 / framesToTarget / framesToTarget;
var spawnNum = ceil( distance / 4 );
var circle = scrMakeCircle( spawnX, spawnY, circleAngle, spawnNum, accel * framesToTarget, spawnObj );
for( var i = 0; i < array_length_1d( circle ); ++i ) {
    circle[i].gravity = accel;
    circle[i].gravity_direction = circle[i].direction + 180;
    circle[i].image_blend = color;
}
return circle;
