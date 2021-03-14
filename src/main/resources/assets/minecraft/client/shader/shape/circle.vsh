uniform vec2 resolution;
uniform float radius = 6.0;

vec3 rgb(float r, float g, float b)
{
    return vec3(r / 255.0, g / 255.0, b / 255.0);
}

vec4 circle(vec2 uv, vec2 pos, float rad, vec3 color)
{
    float d = length(pos - uv) - rad;
    float t = clamp(d, 0.0, 1.0);
    return vec4(color, 1.0 - t);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy;
    vec2 center = resolution.xy;
    //vec4 layer1 = fragColor;
    float radius = (resolution.y/2.0) - 10.0;
    vec3 red = rgb(225.0, 95.0, 60.0);
    vec4 layer2 = circle(uv, center, radius, red);
    fragColor = mix(fragColor, layer2, layer2.a);
}

void main(void)
{
    mainImage(gl_FragColor, gl_FragCoord.xy);
}