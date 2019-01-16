var s24ExplosionX = argument0;
var s24RngCount = 40;
for( var i = 0; i < s24RngCount; i++ ) {
    var bullet = instance_create( s24ExplosionX, 100, oRedireS24FountainBullet );
    bullet.speed = random_range( 4, 8 );
    bullet.direction = random( 360 );
}
var s24WallCount = 6;
var s24BulletStartOffset = 64;
var s24BulletOffset = -s24BulletStartOffset;
 for( var i = 0; i < s24WallCount; i++ ) {
    var s24WallBullet = instance_create( s24ExplosionX + s24BulletOffset, 116, oRedireS24FountainBullet );
    s24WallBullet.direction = -90;
    s24WallBullet.speed = 7;
    s24BulletOffset += s24BulletStartOffset * 2 / s24WallCount;
    var s24Scale = 1;
    s24WallBullet.image_xscale = s24Scale;
    s24WallBullet.image_yscale = s24Scale;
} 
