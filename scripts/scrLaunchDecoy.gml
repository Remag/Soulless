var skin = argument0;

with( oKidDecoy ) {
    fadeOut = true;
}

audio_play_sound( choose( sndDecoyAppear1, sndDecoyAppear2, sndDecoyAppear3, sndDecoyAppear4, sndDecoyAppear5 ), 0, false );
repeat( 30 ) {
    var particleDir = random( 360 );
    var particleX = x - 2 * xScale + lengthdir_x( 7, particleDir );
    var particleY = y - 2 + lengthdir_y( 8, particleDir );
    var particle = instance_create( particleX, particleY, oDecoyParticle );
    particle.direction = particleDir;
    particle.speed = random_range( 0.5, 1.4 );
    particle.image_blend = skin.decoyParticleColor;
}

var decoy = instance_create( x, y, oKidDecoy );
decoy.image_xscale = xScale;
decoy.image_speed = skin.decoyIdleAnimationSpeed;
decoy.sprite_index = skin.decoyIdleSprite;


