///scrMakeShape(x,y,sides,skips,bullets_per_side,direction,speed,object);

var start_x = argument0;
var start_y = argument1;
var N = argument2;
var S = argument3;
var SN = argument4;
var dir = argument5;
var spd = argument6;
var obj = argument7;
var i;
var j;

if(dir == -1 ) {
    dir = random(360);
}
for( i = 0; i < N; i++ ) {
    var xx1 = start_x + dcos(i/N * 360);
    var xx2 = start_x + dcos(((i+S) mod N)/N * 360);
    var yy1 = start_y + dsin(i/N * 360);
    var yy2 = start_y + dsin(((i+S) mod N)/N * 360);
    for( j = 0; j < SN; j++ ) {
    var xx = lerp(xx1,xx2,j/SN);
    var yy = lerp(yy1,yy2,j/SN);
        a = instance_create(xx, yy, obj);
        a.direction = dir + point_direction(start_x, start_y, xx, yy);
        a.speed = point_distance(start_x, start_y, xx, yy) * spd;
    }
}
