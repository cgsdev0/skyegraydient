shader_type canvas_item;

uniform sampler2D gradient2: source_color, filter_nearest;
uniform sampler2D gradient3: source_color, filter_nearest;

uniform int colors: hint_range(1, 3, 1) = 1;

uniform float amount: hint_range(0.0, 1.0) = 0.0;
uniform float rotation: hint_range(0.0, 360.0) = 0.0;

void fragment() {
	vec2 ndc = UV * 2.0 - 1.0;
	float theta = mod(atan(ndc.y, ndc.x) + TAU + rotation / 180.0 * PI, TAU);
	vec3 one = texture(gradient2, vec2(0.0)).rgb;
	vec3 two = texture(gradient2, vec2(UV.y, 0.0)).rgb;
	vec3 three = texture(gradient3, vec2(theta / TAU, 0.0)).rgb;
	float c = float(colors);
	vec3 rgb = one * step(c, 1.0);
	rgb += two * step(c, 2.1) * step(1.1, c);
	rgb += three * step(2.1, c);
	COLOR = vec4(mix(COLOR.rgb, rgb, amount), COLOR.a);
}