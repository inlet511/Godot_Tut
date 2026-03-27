shader_type canvas_item;

uniform vec4 hurt_color = vec4(1.0,1.0,1.0,1.0);
uniform bool is_hurt = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	if(is_hurt){
		color.rgb = mix(color.rgb, hurt_color.rgb, 0.5);
	}
	COLOR = color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
