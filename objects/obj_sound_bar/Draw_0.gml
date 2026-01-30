
draw_self();

var _knob_amount = global.VOLUME / amount_max;
var _knob_position_x = x + (sprite_width * _knob_amount);

draw_sprite(spr_volume_slider, 0, _knob_position_x, y);
	
