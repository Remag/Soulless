///scrBackgroundColorStep(colorFrom,colorTo,maxStep)
var colorFrom = argument0;
var colorTo = argument1;
var colorStep = argument2;

var red1 = colour_get_red( colorFrom );
var red2 = colour_get_red( colorTo );
var redDif = red2 - red1;
if( abs( redDif ) > colorStep ) {
    redDif = sign( redDif ) * colorStep;
}

var green1 = colour_get_green( colorFrom );
var green2 = colour_get_green( colorTo );
var greenDif = green2 - green1;
if( abs( greenDif ) > colorStep ) {
    greenDif = sign( greenDif ) * colorStep;
}

var blue1 = colour_get_blue( colorFrom );
var blue2 = colour_get_blue( colorTo );
var blueDif = blue2 - blue1;
if( abs( blueDif ) > colorStep ) {
    blueDif = sign( blueDif ) * colorStep;
}

return make_colour_rgb( red1 + redDif, green1 + greenDif, blue1 + blueDif );
