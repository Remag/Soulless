var t = argument0;
var duration = argument1;

var startVal = argument2;
var targetVal = argument3;

if( t >= duration ) {
    return targetVal;
} else {
    var timeRatio = t * 2.0 / duration; 
    var tweenPos;
    if( timeRatio < 1 ) {
        tweenPos = 0.5 * timeRatio * timeRatio;
    } else {
        tweenPos = -0.5 * ( ( timeRatio - 1 ) * ( timeRatio - 3 ) - 1 );
    }
    return startVal + ( targetVal - startVal ) * tweenPos;
}
