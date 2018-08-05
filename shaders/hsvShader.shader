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
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float in_hue;

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec3 hsvRotate(vec3 c, float hue)
{
    hue *= 6.;
    if( hue > 4. ) {
        c = vec3( c.b, c.r, c.g );
        hue -= 4.;
    } else if( hue > 2. ) {
        c = vec3( c.g, c.b, c.r );
        hue -= 2.;
    }
    if( hue > 1. ) {
        c += vec3( c.b, c.r, c.g ) - vec3( c.g, c.b, c.r );
        c = clamp( c, 0., 1. );
        hue -= 1.;
    }
    
    c += ( vec3( c.b, c.r, c.g ) - vec3( c.g, c.b, c.r ) ) * hue;
    return clamp( c, 0., 1. );
}

void main() 
{
     lowp vec4 texture = texture2D( gm_BaseTexture, v_vTexcoord );
     /*vec3 hsv = rgb2hsv( texture.rgb );
     hsv.x += in_hue;
     if( hsv.x > 1.0 ) {
        hsv.x -= 1.0;
     }
     texture.rgb = hsv2rgb( hsv );*/
     texture.rgb = hsvRotate( texture.rgb, in_hue );
     gl_FragColor = v_vColour * texture;
}


