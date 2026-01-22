//Draw black rectangle and fade it in and out

//draw the rectangle and set to alpha in Create step
draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(0,0,gui_width,gui_height,false);

//reset alpha to 1 following drawing the rectangle
draw_set_alpha(1);

//Check if fading in/out and update alpha to make transition
if (fading_out) {
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1; // Cap alpha at 1
        if (target_room != noone) {
            room_goto(target_room); // Go to the next room
        }
        fading_out = false; // The object persists and now starts fading in the new room
    }
} else { // Fading in
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0) {
        fade_alpha = 0; // Cap alpha at 0
        instance_destroy(); // Destroy the object once the fade-in is complete
    }
}