//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;    // vec2( x, y )
varying vec4 v_vColour;      // vec4( r, g, b, a )

// Custom parameters. We must pass them manualy!
uniform float pixelWidth;
uniform float pixelHeight;

void main()
{
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
     
	vec2 offsetX = vec2( pixelWidth, 0.0 );
	vec2 offsetY = vec2( 0.0, pixelHeight );
 
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord - offsetX ).a;
	alpha += texture2D( gm_BaseTexture, v_vTexcoord + offsetX ).a;
	alpha += texture2D( gm_BaseTexture, v_vTexcoord - offsetY ).a;
	alpha += texture2D( gm_BaseTexture, v_vTexcoord + offsetY ).a;
 
	gl_FragColor.a = alpha;
}