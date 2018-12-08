///scrBackgroundSetColorTo(color)
var color = argument0;

if( !instance_exists( objAlgShaderBackground ) ) {
    instance_create( 400, 304, objAlgShaderBackground );
} else {
    with( objAlgShaderBackground ) {
         targetColor1 = color;
         targetColor2 = color;
         targetColor3 = color;
    }
}
