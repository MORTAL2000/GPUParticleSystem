// ------------------------------------------------------------------
// CONSTANTS --------------------------------------------------------
// ------------------------------------------------------------------

const vec3 PARTICLE_VERTICES[6] = vec3[](
	vec3(-1.0, -1.0, 0.0), // 0
	vec3(1.0, -1.0, 0.0),	 // 1
	vec3(-1.0, 1.0, 0.0),	 // 2
	vec3(-1.0, 1.0, 0.0),	 // 3
	vec3(1.0, -1.0, 0.0),	 // 4
	vec3(1.0, 1.0, 0.0)	 // 5
);

// ------------------------------------------------------------------
// UNIFORMS ---------------------------------------------------------
// ------------------------------------------------------------------

uniform float u_Rotation;
uniform vec3 u_Position;
uniform mat4 u_View;
uniform mat4 u_Proj;

// ------------------------------------------------------------------
// MAIN -------------------------------------------------------------
// ------------------------------------------------------------------

void main()
{
    vec3 quad_pos = PARTICLE_VERTICES[gl_VertexID];

    // rotate the billboard:
	mat2 rot = mat2(cos(u_Rotation), -sin(u_Rotation), 
                    sin(u_Rotation), cos(u_Rotation));
	
    quad_pos.xy = rot * quad_pos.xy;

    vec4 position = u_View * vec4(u_Position, 1.0);
    position.xyz += quad_pos;

    gl_Position = u_Proj * position;
}

// ------------------------------------------------------------------