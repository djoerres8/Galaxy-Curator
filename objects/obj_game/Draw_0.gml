/// @description Insert description here
// You can write your code in this editor

if (room == rm_game_complete){
	draw_set_font(font_credits);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width / 2, room_height / 2 - 200, "You Completed all the levels!");
	draw_text(room_width / 2, room_height / 2 - 100, "Thank you for playing our game!");
	draw_text(room_width / 2, room_height / 2, "This Game was made with love by David, Rad, and Charlie.");
}