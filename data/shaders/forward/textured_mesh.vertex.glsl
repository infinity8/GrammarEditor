
attribute vec3 a_position;
attribute vec3 a_normal; 
attribute vec2 a_texCoord0;

uniform mat4 u_pv;
uniform mat4 u_mm;

uniform vec3 u_viewPos;

varying float v_vposLen;

varying vec2 v_texCoords;
varying vec3 v_pos;
varying vec3 v_normal;

uniform mat4 u_depthBiasMVP;
varying vec4 v_shadowCoords;

void main()
{	
	vec4 worldPos = u_mm * vec4(a_position, 1.0);
	gl_Position = u_pv * worldPos;

	v_pos = worldPos.xyz;
	v_texCoords = a_texCoord0;
	v_normal = ( u_mm * vec4( a_normal, 0.0 ) ).xyz;

	v_vposLen = length(u_viewPos-worldPos.xyz);

	v_shadowCoords = u_depthBiasMVP * vec4(worldPos.xyz, 1.0);
}