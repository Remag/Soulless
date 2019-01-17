///scrA25Spawn(spawnCount,spawnCircleY,spawnDir)
///argument0 - spawnCount
///argument1 - spawnCircleY
///argument2 - spawnDir

var spawnCount = argument0;
var spawnCircleY = argument1;
var spawnDir = argument2;
var spawnXSpeed = argument3;
var spawnYSpeed = argument4;

var spawnRadius = random_range( 50, 80 );
var spawnRotationSpeed = random_range( 2, 3 ) * choose( -1, 1 );
if( spawnCount == 4 ) {
    spawnRadius = random_range( 65, 100 );
    spawnRotationSpeed = random_range( 1.65, 2.3 ) * choose( -1, 1 );
} else if( spawnCount >= 5 ) {
    spawnRadius = random_range( 80, 120 );
    spawnRotationSpeed = random_range( 1.3, 1.85 ) * choose( -1, 1 );
}

var spawnCircleX = 900;
if( ( spawnDir == 1 ) == ( spawnXSpeed > 0 ) ) {
    spawnCircleX = -100;
}
spawnCircleY -= spawnRadius;
var color = make_colour_hsv( random( 255 ), 255, 255 );
var circle = scrMakeCircle( 800, 608, random( 360 ), spawnCount, 1, objAlgA25Star );
for( var i = 0; i < spawnCount; i++ ) {
    circle[i].image_blend = color;
    circle[i].circleX = spawnCircleX;
    circle[i].circleSpeedX = spawnXSpeed * spawnDir;
    circle[i].spawnDir = spawnDir;
    circle[i].circleSpeedY = spawnYSpeed;
    circle[i].circleRadius = spawnRadius
    circle[i].circleY = spawnCircleY;
    circle[i].circleAngle = circle[i].direction;
    circle[i].circleRotationSpeed = spawnRotationSpeed;
    circle[i].speed = 0;
    circle[i].circleId = seg24YCircleId;
}
seg24YCircleId++;
