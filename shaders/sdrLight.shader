//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//

uniform vec4 uvs;
uniform float uIntensity;
uniform float uSquareModifier;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() 
{
    vec2 uv = (v_vTexcoord - uvs.xy) * uvs.zw;
    uv = ( uv - 0.5 ) * 2.0;
    if( uSquareModifier > 0. ) {
        uv.x = max( abs( uv.x ) - uSquareModifier, 0. ) / ( 1.0 - uSquareModifier );
    } else {
        uv.y = max( abs( uv.y ) + uSquareModifier, 0. ) / ( 1.0 + uSquareModifier );
    }
    float posIntensity = 1.0 - dot( uv, uv );
    vec3 colorVal = v_vColour.rgb * posIntensity * uIntensity;
    float baseVal = max( colorVal.r, max( colorVal.g, colorVal.b ) );
    baseVal = clamp( 0.0, 1.0, baseVal - 1.0 );
    colorVal += vec3( baseVal );
    colorVal = clamp( vec3( 0.0 ), vec3( 1.0 ), colorVal );
    
    gl_FragColor = vec4( colorVal, v_vColour.a );
}


