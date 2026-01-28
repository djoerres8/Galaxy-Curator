// delay 
if (delay > 0) {
    delay--;
}else{
	// animate toward target
	slide_t = clamp(slide_t + slide_speed, 0, 1);

    // ease-out-back curve (overshoot + rebound)
    var t = slide_t;
    var c1 = 1.70158;
    var c3 = c1 + 1;
    var eased = 1 + c3 * power(t - 1, 3) + c1 * power(t - 1, 2);
    x = lerp(start_x, resting_x, eased);
}


