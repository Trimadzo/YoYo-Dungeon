//
// This shader simply uses the ALPHA from the sprite to "cut" out the shape, then sets the colour to the vertex colour
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	
	// Alpha test - "cut" out sprite
	if( col.a<0.8 ) discard;
	
	// set "mask" colour
    gl_FragColor = v_vColour;
}
