var objectId = argument0;
var speedMin = argument1;
var speedMax = argument2;

var newX = random_range( 0, 800 );
var newY = -10;

var newSpeed

var bullet = instance_create( newX, newY, objectId );
bullet.direction = random( 60 ) - 120;
bullet.speed = random_range( speedMin, speedMax );
bullet.image_angle = bullet.direction;
