///scrA43CircleSpawn(x,y,radius,startDelay,count)
///argument0 - spawnCount
///argument1 - spawnCircleY
///argument2 - spawnDir

var spawnX = argument0;
var spawnY = argument1;
var spawnRadius = argument2;
var spawnStartDelay = argument3;
var count = argument4;

var angle = random( 360 );
var dirValue = choose( -90, 90 );
var color = make_color_hsv( random( 255 ), 255, 255 );
var playerX = scrGetPlayerX();
var playerY = scrGetPlayerY();
for( var i = 0; i < count; i++ ) {
    var obj = instance_create( playerX, playerY, objAlgA43Circle );
    var spawnAngle = angle + i * 360 / count;
    
    var targetX = spawnX + spawnRadius * cos( degtorad( spawnAngle ) );
    var targetY = spawnY - spawnRadius * sin( degtorad( spawnAngle ) );
    
    obj.speed = point_distance( playerX, playerY, targetX, targetY ) / 25;
    obj.direction = point_direction( playerX, playerY, targetX, targetY );
    
    obj.savedDirection = spawnAngle + dirValue; 
    obj.startDelay = spawnStartDelay;
    obj.image_blend = color;
}
