var frameT = argument0;
var t = floor( frameT / 50 );
var timeText = string( t div 60 ) + ":";
t = t mod 60;
timeText += string( t div 10 );
t = t mod 10;
timeText += string(floor(t)) + ".";
var subSeconds = frameT / 50 - t;
subSeconds = subSeconds - floor( subSeconds );
subSeconds *= 10;
timeText += string( floor( subSeconds ) );
subSeconds = subSeconds - floor( subSeconds );
subSeconds *= 10;
timeText += string( floor( subSeconds ) );

return timeText;
