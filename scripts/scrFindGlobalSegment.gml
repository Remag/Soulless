var gate = argument0;
var segment = argument1;

var result = 0;
for( var i = 1; i < gate; i++ ) {
    result += scrGetGateSegmentCount( i );
}
return result + segment + 1;
