///scrBackgroundSetMultipleColorTo(color1,color2,color3)
var color1 = argument0;
var color2 = argument1;
var color3 = argument2;

if( !instance_exists( objAlgShaderBackground ) ) {
    instance_create( 400, 304, objAlgShaderBackground );
} else {
    with( objAlgShaderBackground ) {
         targetColor1 = color1;
         targetColor2 = color2;
         targetColor3 = color3;
    }
}
