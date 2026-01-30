// Base visual values
base_scale = random_range(1, 2.0);
image_xscale = base_scale;
image_yscale = base_scale;

base_alpha = random_range(0.4, 0.9);
image_alpha = base_alpha;

// Twinkle
twinkle_speed = random_range(0.01, 0.03);
twinkle_offset = random(1000);

// Blink control
image_speed = 0;
image_index = 0;

blink_chance = 0.03; // ~3% chance per second
blink_cooldown = irandom_range(60, 240); // delay before it can blink again
blink_timer = blink_cooldown;
