//The starting position, update these to change the 
var xx = 248;
var yy = 128;

//variables to adjust as more levels get added
rowBreak = 0; // for when to start new line
sprites_in_row = 4;
max_level = 3

//generate levels up to max in rows of how many specified above
//may need to redo to make more dynamic, right now uses sprite heights and pixel numbers to set distances
for(i=0;i<max_level;i++)
{
    if(rowBreak == sprites_in_row)
	{
        xx = 248;
        yy = obj_level_select_button.sprite_height;
        rowBreak = 0;
    }
    ins = instance_create_depth(xx,yy,0,obj_level_select_button);
        ins.level_select_option = i; 
    xx += obj_level_select_button.sprite_width*1.2;
    rowBreak++;
}