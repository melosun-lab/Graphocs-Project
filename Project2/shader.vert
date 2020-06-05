#version 330 core
// NOTE: Do NOT use any version older than 330! Bad things will happen!

// This is an example vertex shader. GLSL is very similar to C.
// You can define extra functions if needed, and the main() function is
// called when the vertex shader gets run.
// The vertex shader gets called once per vertex.

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;

// Uniform variables can be updated by fetching their location and passing values to that location
uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;

// Outputs of the vertex shader are the inputs of the same name of the fragment shader.
// The default output, gl_Position, should be assigned something. You can define as many
// extra outputs as you need.
out float sampleExtraOutput;
out vec3 ExtraOutputColor;
out vec4 worldPosition;
out vec4 worldNormal;

void main()
{
    //OpenGL maintains the D matrix so you only need to multiply by P, V (aka C inverse), and M
    vec4 Position = model * vec4(position, 1.0);
    vec4 Normal = model * vec4(color, 0.0);
    
    vec4 color_normal = model * vec4(color, 0.0);
    
    vec3 out_color = vec3(color_normal.x, color_normal.y, color_normal.z);
    
    gl_Position = projection * view * model * vec4(position, 1.0);
    
    sampleExtraOutput = 1.0f;
    ExtraOutputColor = out_color;
    worldPosition = Position;
    worldNormal = Normal;
}
