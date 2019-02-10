var skin = argument0;

if( instance_number( objBullet ) < 4 ) {
    var bullet = instance_create( x, y - 2, objBullet );
    bullet.sprite_index = skin.bulletSprite;
    audio_play_sound( sndShoot, 0, false );
}
