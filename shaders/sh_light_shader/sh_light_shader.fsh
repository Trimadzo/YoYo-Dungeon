//
// Shader to allow us to easily "invert" the alpha value of the light surface, 
// and apply an ambient level to non-lit areas.
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_ambient_lighting;

void main()
{
	vec4 col =  texture2D( gm_BaseTexture, v_vTexcoord );
	
	// Make the alpha from a simple gray of the sprite (it's usually white so...)
	float alpha =(1.0-((col.r+col.g+col.b)/3.0));
	
	// the ambient should affect the areas where the lights are. Helps make the lights feel warmer.
	float ambient = u_ambient_lighting.a*alpha;			
	
	// allows us to "tint" if we really want to
    gl_FragColor.rgb = v_vColour.rgb * col.rgb + (u_ambient_lighting.rgb*vec3(ambient,ambient,ambient));
	
	// allow the darkness to be user defines - not just jet black
	gl_FragColor.a =  v_vColour.a*alpha; 
}
