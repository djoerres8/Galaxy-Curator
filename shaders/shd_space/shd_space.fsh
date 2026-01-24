//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texture_size;

void main()
{
	vec2 texel = 1. / texture_size;
	
	vec4 final_color = texture2D(gm_BaseTexture, v_vTexcoord) +
		texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 1920.*texel.x, v_vTexcoord.y)) +
		texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 1920.*texel.x, v_vTexcoord.y)) +
		texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 1080.*texel.y)) +
		texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 1080.*texel.y)) / 5.;
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
