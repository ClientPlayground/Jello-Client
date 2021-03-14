
uniform vec2 resolution;
uniform float radius = 6.0;

float udRoundRect(vec2 p, vec2 b, float r)
{
    return length(max(abs(p) - b, 0.0)) - r;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 rDiv2 = resolution.xy;
    float rradius = radius * 10;
    vec2 uv = fragCoord / resolution.xy;
    float a = clamp(udRoundRect(fragCoord - rDiv2, uv, rDiv2 - rradius), 0.0, 1.0);
    fragColor = mix(vec4(1.0, 1.0, 1.0, 1.0), fragColor, a);
}

void main(void)
{
    mainImage(gl_FragColor, gl_FragCoord.xy);
}