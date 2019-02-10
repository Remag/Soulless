var section = argument0;
var targetObject = argument1;

if( section == 0 ) {
    for( var i = 0; i < 50; i++ ) {
        var particle = instance_create( 0, 0, oItemChangeParticle );
        particle.parent = targetObject;
    }
} else if( section == 1 ) {

}
