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

//######################_==_YOYO_SHADER_MARKER_==_######################@~precision lowp float;

//uniform vec2 iResolution;
uniform float iTime;
uniform vec4 uvs;
uniform vec4 uModifiers;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

#define TAU 6.28318530716

float spiral(vec2 p,float scl, float phase) 
{
float r = length(p);
r = log(r);
float a = atan(p.y, p.x);
return abs(mod(scl*(r-1.0/scl*a) - phase*2.0,TAU)-1.)/2.0;
}

void main()
{
    vec2 uv = (v_vTexcoord - uvs.xy) * uvs.zw;
    uv -= 0.5;
    float modifier1 = uModifiers.x / spiral(uv, 1.0, iTime + 2.3);
    float modifier2 = uModifiers.y / spiral(uv, 2.0, iTime);
    float modifier3 = uModifiers.z / spiral(uv, 3.0, iTime*2.0 - 1.0);
    float modifier4 = uModifiers.w / spiral(uv, 25.0, iTime*5.0 - 2.0);
    //vec3 col = vec3( 0.2, 0.1, 0.3 );
    gl_FragColor = vec4( v_vColour.rgb
                * (modifier1 +
                   modifier2 +
                   modifier3 + 
                   modifier4)/4.0, v_vColour.a);
}





