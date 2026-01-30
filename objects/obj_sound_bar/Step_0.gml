
if (is_being_dragged){

	var _xx = abs(x - mouse_x);
	var _amount = _xx / sprite_width;

	if (mouse_x > x){	
		global.VOLUME = clamp(_amount, 0, 1) * 100;	
	}else{
		global.VOLUME = 0;
	}
	
}
