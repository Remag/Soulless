var radius = argument0;
var image = argument1;
var count = argument2;
var avgSpeed = argument3;

var centerX = 32;
var backdropX = 0;
if( s18SideX > 400 ) {
    centerX = 768;
    backdropX = 800;
}
var centerY = 576;
var scale = 0.4;

var dirDelta = 180 / count;
for( var circleDir = 0; circleDir < 180; circleDir += dirDelta ) {
    var distance = radius + random_range( -10, 10 );
    var relX = lengthdir_x( distance, circleDir );
    var relY = lengthdir_y( distance, circleDir );
    var circle = instance_create( centerX + relX, centerY + relY, oRedireS18CircleBullet );
    circle.direction = point_direction( circle.x, circle.y, centerX, centerY ) + random_range( -90, 90 );
    circle.speed = avgSpeed + random_range( -0.5, 0.5 );    
    circle.image_index = image;
    circle.image_xscale = scale;
    circle.image_yscale = scale;
    circle.image_alpha = 0;
    circle.fadeInDelta = 0.2;
}

// Set the backdrop for effects.
with( oRedireS18Backdrop ) {
    instance_destroy();
}

var backdrop = instance_create( backdropX, 608, oRedireS18Backdrop );
var scale = radius / ( backdrop.sprite_width / 2 - 48 );
backdrop.image_xscale = scale;
backdrop.image_yscale = scale;
