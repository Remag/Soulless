var dist = abs( argument0 - argument1 );
if( dist <= 96 ) {
    CurrentIntensity = lerp( FlickerIntensity + 1, 0, dist / 96 );
}
