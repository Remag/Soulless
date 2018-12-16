///shader_set_uniform_color(pos,color)
var pos = argument0;
var color = argument1;

shader_set_uniform_f( pos, colour_get_red( color ) / 255, colour_get_green( color ) / 255, colour_get_blue( color ) / 255 );
