///scrBackgroundMoveTo(x,y,time)
var backX = argument0;
var backY = argument1;
var time = argument2;

if( !instance_exists( objAlgShaderBackground ) ) {
    instance_create( backX, backY, objAlgShaderBackground );
} else {
    with( objAlgShaderBackground ) {
        if( time <= 1 ) {
            x = backX;
            y = backY;
            speed = 0;
        } else {
            hspeed = ( backX - x ) / time;
            vspeed = ( backY - y ) / time;
            speed *= 2;
            friction = speed / time;
        }
    }
}
