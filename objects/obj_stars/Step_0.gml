twinkle_offset += twinkle_speed;

var twinkle = sin(twinkle_offset) * 0.05;

image_xscale = base_scale + twinkle;
image_yscale = base_scale + twinkle;
image_alpha  = clamp(base_alpha + twinkle, 0, 1);


blink_timer--;

if (blink_timer <= 0 && image_index == 0) {
    if (random(1) < blink_chance) {
        image_speed = 0.5; // play animation
    }
    blink_timer = blink_cooldown;
}


if (image_speed > 0 && image_index >= image_number - 1) {
    image_speed = 0;
    image_index = 0;
}
