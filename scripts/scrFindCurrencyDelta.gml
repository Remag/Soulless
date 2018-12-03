var realDelta = argument0;

var delta = round( realDelta / 50 );
var absDelta = max( 1, abs( delta ) );
return absDelta * sign( delta );
