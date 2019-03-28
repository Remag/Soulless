var s24ExplosionX = argument0;
var s24RngCount = 30;
for( var i = 0; i < s24RngCount; i++ ) {
    var bullet = instance_create( s24ExplosionX, 100, oRedireS23ExplosionBullet );
    bullet.speed = random_range( 4, 8 );
    bullet.direction = random( 360 );
}
var s24WallCount = 6;
var s24BulletStartOffset = 64;
 for( var i = 0; i < s24WallCount; i++ ) {
    var s24BulletOffsetX = random_range( -s24BulletStartOffset, s24BulletStartOffset );
    var s24BulletOffsetY = random_range( -10, 10 );
    var s24WallBullet = instance_create( s24ExplosionX + s24BulletOffsetX, s24BulletOffsetY, oRedireS23WallBullet );
    s24WallBullet.direction = -90;
    s24WallBullet.speed = random_range( 6, 7 );
} 
