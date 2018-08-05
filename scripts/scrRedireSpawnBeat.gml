var killer = argument0;
var newBeat;

if( killer ) {
    newBeat = instance_create( x, y, objRedireBeat );
} else {
    newBeat = instance_create( x, y, objRedireBeatButNotKiller );
}
newBeat.direction = spawnDir;
newBeat.speed = 20;
newBeat.image_speed = 0.7;
newBeat.image_angle = spawnDir;
newBeat.image_xscale = 1.5
