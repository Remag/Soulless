///scrMakeShapes(xFrom,yFrom,xTo,yTo,numprojectiles,obj)
///spawns a custom shape
///argument0 - spawn X
///argument1 - spawn Y
///argument2 - starting angle
///argument3 - number of edges (3=triangle, 4=square, etc.)
///argument4 - projectile spawns per edge
///argument5 - speed
///argument6 - projectile to spawn

var xFrom = argument0;
var yFrom = argument1;
var xTo = argument2;
var yTo = argument3;
var spawnNum = argument4;
var spawnObj = argument5;

var line;
for( var i = 0; i < spawnNum; i++ ) {
    spawnX = lerp( xFrom, xTo, i / ( spawnNum - 1 ) );
    spawnY = lerp( yFrom, yTo, i / ( spawnNum - 1 ) );
    line[i] = instance_create( spawnX, spawnY, spawnObj );
}
return line;
