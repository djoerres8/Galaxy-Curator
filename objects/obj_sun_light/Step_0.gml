//pulse the background
var t = (sin(pulsingSpeed * frame) + 1) * 0.5; // 0 → 1
image_xscale = lerp(4, 5, t);
image_yscale = image_xscale;

frame++;
