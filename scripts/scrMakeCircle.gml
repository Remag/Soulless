///scrMakeCircle(x,y,angle,numprojectiles,speed,obj)
///spawns a ring of projectiles
///argument0 - spawn X
///argument1 - spawn Y
///argument2 - starting angle
///argument3 - number of projectiles to spawn
///argument4 - speed
///argument5 - projectile to spawn

var spawnX = argument0;
var spawnY = argument1;
var spawnAngle = argument2;
var spawnNum = argument3;
var spawnSpeed = argument4;
var spawnObj = argument5;
var a;

var result;
for (var i = 0; i < spawnNum; i += 1)
{
    result[i] = instance_create(spawnX,spawnY,spawnObj);
    result[i].speed = spawnSpeed;
    result[i].direction = spawnAngle + i * (360 / spawnNum);
    result[i].image_angle = result[i].direction;
}

return result;
