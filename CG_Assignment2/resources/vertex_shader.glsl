#version 330 core

// Input vertex data, different for all executions of this shader.
layout(location = 0) in vec3 vertex_position;
layout(location = 1) in vec2 vertex_uv;

// Output data ; will be interpolated for each fragment.
out vec2 uv;

// Values that stay constant for the whole mesh.
uniform mat4 mvp;

void main(){
	
	float angle = 1.57;
	mat4 rotation = mat4(
        vec4(cos(angle), -sin(angle), 0.0, 0.0),
        vec4(sin(angle), cos(angle), 0.0, 0.0),
        vec4(0.0, 0.0, 1.0, 0.0),
        vec4(0.0, 0.0, 0.0, 1.0)
    );

	// Output position of the vertex, in clip space : MVP * position
	gl_Position =  mvp * rotation * vec4(vertex_position, 2);
	
	// UV of the vertex. Just passing it to the fragment shader
	uv = vertex_uv;
}
