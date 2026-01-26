//draw the rules for the level
var level_rules = global.LEVELS[global.CURRENT_LEVEL].rules;
var y_placement = room_height - 500;

draw_set_font(font_rules);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var i = 0; i < array_length(level_rules); i++) {
    var rule = level_rules[i](1);
	draw_sprite(spr_checkbox, level_rules[i](0), 10, y_placement+4);
	draw_text(32, y_placement, rule);
    y_placement += 32; // line height
}
