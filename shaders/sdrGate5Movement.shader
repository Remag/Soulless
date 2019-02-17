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
uniform vec4 uMargin;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

#define tau 6.28318530718

float sin01(float x) {
return (sin(x*tau)+1.)/2.;
}
float cos01(float x) {
return (cos(x*tau)+1.)/2.;
}

// rand func from theartofcode (youtube channel)
vec2 rand01(vec2 p) {
    vec3 a = fract(p.xyx * vec3(123.5, 234.34, 345.65));
    a += dot(a, a+34.45);
    
    return fract (vec2(a.x * a.y, a.y * a.z));
}

float distFn(float t, vec2 from, vec2 to) {
float x = length (from - to);
    return pow (x, cos01(t/10.)*4.+1.2);
}

float voronoi(vec2 uv, float t, float seed, float size) {
    
    float minDist = 100.;
    
    float gridSize = size;
    
    vec2 cellUv = fract(uv * gridSize) - 0.5;
    vec2 cellCoord = floor(uv * gridSize);
    
    for (float x = -1.; x <= 1.; ++ x) {
        for (float y = -1.; y <= 1.; ++ y) {
            vec2 cellOffset = vec2(x,y);
            
            // Random 0-1 for each cell
            vec2 rand01Cell = rand01(cellOffset + cellCoord + seed);

            // Get position of point in cell
            vec2 point = cellOffset + sin(rand01Cell * (t+10.)) * .5;
            
// Get distance between pixel and point
            float dist = distFn(t, cellUv, point);
    minDist = min(minDist, dist);
        }
    }
    
    return minDist;
}

void main()
{
    // Center coordinates at 0
    vec2 uv = (v_vTexcoord - uvs.xy) * uvs.zw;
    if( uv.y < uMargin.y || uv.y > uMargin.w || uv.x < uMargin.x || uv.x > uMargin.z ) {
        lowp vec4 texture = texture2D( gm_BaseTexture, v_vTexcoord );
        gl_FragColor = vec4( texture.rgb / 2., texture.a * v_vColour.a );
    } else {
        float t = iTime * .7;
        
        float edgeFade = clamp( 0.0, 1.0, 1. - max( abs( uv.x - 0.5 ), abs( uv.y - 0.5 ) ) * 2. );
        edgeFade = sqrt( edgeFade );
       // Distort uv coordinates
        float amplitude = .05;
        float turbulence = 0.8;
        uv.xy += sin01(uv.x*turbulence + t/3.) * amplitude;
        uv.xy -= sin01(uv.y*turbulence + t/3.) * amplitude;
        
        // Apply layers of voronoi
        float v1 = voronoi(uv, t, 0.5, 2.5) * 4.;
        float v2 = voronoi(uv, t * 4., 0., 4.) * 1.6;
        float v3 = 0.05 + clamp( 0.0, 1.0, v2 / 4. ) * 0.95;
    
        vec2 texCoords = vec2( uv.x + v2, uv.y + v1 );
        texCoords = mod( texCoords, 1. );
        texCoords = texCoords / uvs.zw + uvs.xy;
        lowp vec4 texture = texture2D( gm_BaseTexture, texCoords );
        gl_FragColor = vec4( texture.rgb * v3 * edgeFade, texture.a * v_vColour.a );
        //lowp vec4 texture = texture2D( gm_BaseTexture, vec2( v_vTexcoord.x + v2, v_vTexcoord.y ) );
        //vec3 targetColor = mix( vec3( 0.0 ), texture.rgb, 0.5 + v2 / 2. );
        //gl_FragColor = vec4( targetColor, texture.a * v_vColour.a );
    }
}





