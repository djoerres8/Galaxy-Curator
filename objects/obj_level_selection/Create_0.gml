// grid settings
var rows = 6;
var max_levels = 30;

// how many columns we need (max 5)
var cols = ceil(max_levels / rows) + 1;

// margins
var margin_x = 175;
var margin_y = 120;

// spacing calculated to fit screen nicely
var space_x = (room_width  - margin_x * 2) / (cols - 1);
var space_y = (room_height - margin_y * 2) / (rows - 1);

// starting position
var xx = margin_x;
var yy = margin_y;

// counters
rowBreak = 0;
sprites_in_row = cols;


highest_level = 30


// generate levels
for (i = 1; i <= min(highest_level, max_levels); i++)
{
	if (rowBreak == sprites_in_row)
	{
		rowBreak = 0;
		xx = margin_x;
		yy += space_y;
	}

	var ins = instance_create_depth(xx, yy, 0, obj_level_select_button);
	ins.level_select_option = i;

	xx += space_x;
	rowBreak++;
}

// edge case: no save data
if (highest_level == 0)
{
	var ins = instance_create_depth(margin_x, margin_y, 0, obj_level_select_button);
	ins.level_select_option = 1;
}
