//have planet follow hand as it moves around
if(is_held && mouse_check_button(mb_left))
{
    x = mouse_x;
    y = mouse_y;
}
if(is_held && mouse_check_button_released(mb_left))
{
    is_held = false;
}