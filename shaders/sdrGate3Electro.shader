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

/* discontinuous pseudorandom uniformly distributed in [-0.5, +0.5]^3 */
vec3 random3(vec3 c) {
float j = 4096.0*sin(dot(c,vec3(17.0, 59.4, 15.0)));
vec3 r;
r.z = fract(512.0*j);
j *= .125;
r.x = fract(512.0*j);
j *= .125;
r.y = fract(512.0*j);
return r-0.5;
}

/* skew constants for 3d simplex functions */
const float F3 =  0.3333333;
const float G3 =  0.1666667;

/* 3d simplex noise */
float simplex3d(vec3 p) {
 /* 1. find current tetrahedron T and it's four vertices */
 /* s, s+i1, s+i2, s+1.0 - absolute skewed (integer) coordinates of T vertices */
 /* x, x1, x2, x3 - unskewed coordinates of p relative to each of T vertices*/
 
 /* calculate s and x */
 vec3 s = floor(p + dot(p, vec3(F3)));
 vec3 x = p - s + dot(s, vec3(G3));
 
 /* calculate i1 and i2 */
 vec3 e = step(vec3(0.0), x - x.yzx);
 vec3 i1 = e*(1.0 - e.zxy);
 vec3 i2 = 1.0 - e.zxy*(1.0 - e);
 
 /* x1, x2, x3 */
 vec3 x1 = x - i1 + G3;
 vec3 x2 = x - i2 + 2.0*G3;
 vec3 x3 = x - 1.0 + 3.0*G3;
 
 /* 2. find four surflets and store them in d */
 vec4 w, d;
 
 /* calculate surflet weights */
 w.x = dot(x, x);
 w.y = dot(x1, x1);
 w.z = dot(x2, x2);
 w.w = dot(x3, x3);
 
 /* w fades from 0.6 at the center of the surflet to 0.0 at the margin */
 w = max(0.6 - w, 0.0);
 
 /* calculate surflet components */
 d.x = dot(random3(s), x);
 d.y = dot(random3(s + i1), x1);
 d.z = dot(random3(s + i2), x2);
 d.w = dot(random3(s + 1.0), x3);
 
 /* multiply d by w^4 */
 w *= w;
 w *= w;
 d *= w;
 
 /* 3. return the sum of the four surflets */
 return dot(d, vec4(52.0));
}

float noise(vec3 m) {
    return   0.5333333*simplex3d(m)
+0.2666667*simplex3d(2.0*m)
+0.1333333*simplex3d(4.0*m)
+0.0666667*simplex3d(8.0*m);
}

void main()
{
    vec2 uv = (v_vTexcoord - uvs.xy) * uvs.zw;
    uv.y = uv.y * 0.1 + 0.45; 
    uv.x = uv.x * 0.8 + 0.1; 
    vec2 p = vec2( mod( uv.x * 5., 1.0 ), uv.y ); /// 16. * 9.;// * 736. / 32.;  
    uv = uv * 2. -1.;  
 
  vec3 p3 = vec3(p, iTime*0.4);    
    
  float intensity = noise(vec3(p3*8.0+8.0)) * 1.5;
                          
  float t = clamp((uv.x * -uv.x * 0.16) + 0.15, 0., 1.);                         
  float y = abs(intensity * -t + uv.y );
    
  float g = pow(y, 0.2);
  float colorProgress = mod( p.x * 3.0 - iTime * 20., 3.0 );
  vec3 col;
    if( colorProgress < 1.0 ) {
        col = mix( vec3(1.48, 1.70, 1.70), vec3(1.70, 1.48, 1.70), colorProgress );
    } else if( colorProgress < 2.0 ) {
        col = mix( vec3(1.70, 1.48, 1.70), vec3(1.70, 1.70, 1.48), colorProgress - 1.0 );
    } else {
         col = mix( vec3(1.70, 1.70, 1.48), vec3(1.48, 1.70, 1.70), colorProgress - 2.0 );
    }
                          
  //vec3 col = vec3(1.48, 1.70, 1.70);
  col = col * -g + col;                    
  col = col * col;
  col = col * col;
  col = col * col;
  
    gl_FragColor = vec4( col, v_vColour.a);
}





