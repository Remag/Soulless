var prevPbSegment = argument0;
var newPbSegment = argument1;

var gate = scrGetSegmentGate( newPbSegment ); 
var pbGate = scrGetSegmentGate( prevPbSegment );

var result = 0;
for( var i = pbGate; i < gate; i++ ) {
    result += scrGetGateOpenReward( i );
}

return result;
