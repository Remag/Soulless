if( t == 5660 ) {
    if( instance_exists( objPlayer ) && objPlayer.x >= 400 ) {
        var beatSpawner = instance_create( -30, 570, objRedireBeatSpawner );
        beatSpawner.spawnDir = 0;
    } else {
        var beatSpawner = instance_create( 810, 570, objRedireBeatSpawner );
        beatSpawner.spawnDir = 180;
    }
}

if( t == 5660 ) {
    with( objRedireBeatSpawner ) { scrRedireSpawnBeat(false); }
}

if( t == 5715 || t == 5770 || t == 5825 || t == 5880 
    || t == 5935 || t == 5990 || t == 6020 || t == 6050 || t == 6060 ) 
{
    with( objRedireBeatSpawner ) { scrRedireSpawnBeat(true); }
}

if( t < 6050 ) {
    if( t mod 3 == 0 ) {
        scrRedireSpawnBullet( objRedireFrostBullet, 6, 8 );
    }
}

if( t < 5900 ) {
    if( t mod 4 == 0 ) {
        scrRedireSpawnBullet( objRedireFireBullet, 2, 4 );
    }
}

if( t > 6060 ) {
    with( objRedireBeatSpawner ) { instance_destroy(); }
}
