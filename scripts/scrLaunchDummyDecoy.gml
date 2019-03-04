var skin = argument0;

with( oKidDecoy ) {
    fadeOut = true;
}

var decoyX = x + 32;
var decoyScaleX = -xScale;
// Particles.
audio_play_sound( sndDecoyAppear1, 0, false );
repeat( 30 ) {
    var particleDir = random( 360 );
    var particleX = decoyX - 1 * decoyScaleX + lengthdir_x( 7, particleDir );
    var particleY = y - 2 + lengthdir_y( 8, particleDir );
    var particle = instance_create( particleX, particleY, oDecoyParticle );
    particle.direction = particleDir;
    particle.speed = random_range( 0.5, 1.4 );
    particle.image_blend = skin.decoyParticleColor;
}

// Decoy object.
var decoy = instance_create( decoyX, y, oKidDecoy );
decoy.image_xscale = decoyScaleX;

if( vspeed < 0 ) {
    decoy.image_speed = skin.decoyJumpAnimationSpeed;
    decoy.sprite_index = skin.decoyJumpSprite;
} else if( vspeed > 0.5 ) {
    decoy.image_speed = skin.decoyFallAnimationSpeed;
    decoy.sprite_index = skin.decoyFallSprite;
} else {
    decoy.image_speed = skin.decoyIdleAnimationSpeed;
    decoy.sprite_index = skin.decoyIdleSprite;
}


