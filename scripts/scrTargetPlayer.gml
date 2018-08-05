///scrTargetPlayer(x,y)
///returns direction from point to player;
///argument0 - spawn X
///argument1 - spawn Y

var targetX = argument0;
var targetY = argument1;

var playerX = 0;
var playerY = 0;
with( objPlayer ) {
    playerX = x;
    playerY = y;
}
return point_direction( targetX, targetY, playerX, playerY );
