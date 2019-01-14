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

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Noise from IQ
vec2 hash( vec2 p )
{
p = vec2( dot(p,vec2(127.1,311.7)),
 dot(p,vec2(269.5,183.3)) );
return -1.0 + 2.0*fract(sin(p)*43758.5453123);
}

float noise( in vec2 p )
{
const float K1 = 0.366025404;
const float K2 = 0.211324865;

vec2 i = floor( p + (p.x+p.y)*K1 );

vec2 a = p - i + (i.x+i.y)*K2;
vec2 o = (a.x>a.y) ? vec2(1.0,0.0) : vec2(0.0,1.0);
vec2 b = a - o + K2;
vec2 c = a - 1.0 + 2.0*K2;

vec3 h = max( 0.5-vec3(dot(a,a), dot(b,b), dot(c,c) ), 0.0 );

vec3 n = h*h*h*h*vec3( dot(a,hash(i+0.0)), dot(b,hash(i+o)), dot(c,hash(i+1.0)));

return dot( n, vec3(70.0) );
}

// http://lolengine.net/blog/2013/07/27/rgb-to-hsv-in-glsl
vec3 hsv2rgb(vec3 c)
{
vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

// Adapted from lensflare by Musk 
vec3 spotLight(vec2 uv,vec2 pos)
{
vec2 main = uv-pos;
vec2 uvd = uv*(length(uv));

float ang = atan(main.x/main.y);
float dist=length(main); dist = pow(dist,.1);

float f0 = 1.0/(length(main)*16.0+1.0);
f0 = f0 + f0 * (sin(noise(vec2(0.,(pos.x+pos.y)*2.2+ang*4.0+5.954)*2.0))*.1+dist*.1+.8);

vec3 c = - vec3(length(uvd)*.05);
c+=vec3(f0);
return c;
}

void main()
{
     float T = iTime / 24.;
    float T2 = 2.*iTime / 24.;
    float T3 = 3.*iTime / 24.;
    float T_20 = iTime / 20. / 24.;
    //
    vec2 uv = (v_vTexcoord - uvs.xy) * uvs.zw;
    vec2 q = 2.*uv-1.;
    //
    float a = 360. * noise( vec2(0., T_20) );
    mat2 rotmat = mat2(cos(a), -sin(a), sin(a), cos(a));
    q = rotmat*q;
    //
    vec3 tint = vec3(fract(a),1.,1.);
    //
    const float nbc = 128.;
    float st = sin(T_20);
    vec2 c = vec2(0.,0.);
    vec3 col = vec3(0.,0.,0.);
    float inc = 3.14159*cos(0.1*T);
    float d = 0.;
    for(float i=0.; i<nbc; i+=1.)
    {
    c.x = cos(i*inc);
    c.y = sin(i*inc);
    c *= i/nbc;
    d = length(q-c);
    tint.y = fract(T2);
    tint.z = fract(i/nbc*st+T);
    col += clamp(exp(-64.*d),0.,1.) * hsv2rgb(tint);
    }
    // Spots
    vec2 pos;
    pos.x=sin(T2)*.5;
    pos.y=sin(T2*.913)*.5;
    vec3 colf = tint * (spotLight(q,pos) + spotLight(q,-pos));
    //
    col = clamp(col+colf,0.,1.);
    
    gl_FragColor = vec4( v_vColour.rgb * col, v_vColour.a);
}





