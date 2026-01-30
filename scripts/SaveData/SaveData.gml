//functions to save/load levels you have complete
function saveGame(){
	//Set progress to latest level completed
	if (global.CURRENT_LEVEL >= global.HIGHEST_LEVEL_COMPLETED){
			global.HIGHEST_LEVEL_COMPLETED = global.CURRENT_LEVEL+1;
			show_debug_message("updating progress to: " + string(global.HIGHEST_LEVEL_COMPLETED));
	}
	
	show_debug_message("saving progress as: " + string(global.HIGHEST_LEVEL_COMPLETED));
	
	var file = file_text_open_write("save_data.txt");
	
	file_text_write_real(file, global.HIGHEST_LEVEL_COMPLETED);
	
	file_text_close(file);
	
	
	
	//create a save file
	//var save_file = "savedata.txt";
	////store level progress in json format
	//var json = json_stringify(global.HIGHEST_LEVEL_COMPLETED);
	////allocate memory for saving
	//var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
	
	////write to memory
	//buffer_write(buffer, buffer_string, json);
	////save memory to file
	//buffer_save(buffer, save_file);
	////delete allocated memory to eliminate memory leaks
	//buffer_delete(buffer);
}
	
function loadGame(){
	show_debug_message("loading game data.....");
	
	if (file_exists("save_data.txt")){
		var file = file_text_open_read("save_data.txt");
	
		 global.HIGHEST_LEVEL_COMPLETED = file_text_read_real(file);
	
		file_text_close(file);
	}
	
	////find save file
	//var save_file = "savedata.txt";
	////If no save data, exit function
	//if !file_exists(save_file) exit;
	
	////load save file to memory
	//var buffer = buffer_load(save_file);
	////read what's in memory to json format
	//var json = buffer_read(buffer, buffer_string);
	////delete allocated memory
	//buffer_delete(buffer);
	
	////load level progress from save file
	//var load = json_parse(json);
	
	////Set game data to what is in save file
	//global.HIGHEST_LEVEL_COMPLETED = load;
}