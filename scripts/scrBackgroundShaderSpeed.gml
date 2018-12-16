///scrBackgroundShaderSpeed(speedMul)
var speedMul = argument0;

if( !instance_exists( objAlgShaderBackground ) ) {
    instance_create( 400, 304, objAlgShaderBackground );
} else {
    with( objAlgShaderBackground ) {
        shaderSpeed = speedMul / 100;
    }
}
