var t = argument0;
var timeText = string( t div 3600 ) + ":";
t = t mod 3600;
timeText += string( t div 600 );
t = t mod 600;
timeText += string( t div 60 ) + ":";
t = t mod 60;
timeText += string( t div 10 );
t = t mod 10;
timeText += string(floor(t));

return timeText;
