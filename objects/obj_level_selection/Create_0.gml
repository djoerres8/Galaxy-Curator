//The starting position, update these to change the 
var xx = 335;
var yy = 144;

//variables to adjust as more levels get added
rowBreak = 0; // for when to start new line
sprites_in_row = 5;
max_level = 10;
space_between = (room_width-350)/5

//generate levels up to max in rows of how many specified above
//may need to redo to make more dynamic, right now uses sprite heights and pixel numbers to set distances
for(i=0;i<=global.progress;i++)
{
    if(rowBreak == sprites_in_row)
	{
        xx = 335;
        yy += 180;
        rowBreak = 0;
    }
	ins = instance_create_depth(xx,yy,0,obj_level_select_button);
    //ins = instance_create_depth(xx,yy,0,obj_level_select_button);
    ins.level_select_option = i+1; 
    //xx += obj_level_select_button.sprite_width*1.2;
	xx += space_between;
    rowBreak++;
}