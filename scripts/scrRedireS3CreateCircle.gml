var circleX = argument0;
var circleImageId = argument1;

var circleCount = 48;
var circleSpeed = 5;
var circleScale = 3;

var dirDelta = 360 / circleCount;
for( var circleDir = 0; circleDir < 360; circleDir += dirDelta ) {
    var circle = instance_create( circleX, 0, oRedireS3CircleBullet );
    circle.direction = circleDir;
    circle.speed = circleSpeed;    
    circle.image_index = circleImageId;
    circle.image_xscale = circleScale;
    circle.image_yscale = circleScale;
}
