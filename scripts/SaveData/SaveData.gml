//functions to save/load levels you have complete
function saveGame(){
	//Set progress to latest level completed
	if (global.CURRENT_LEVEL <= global.progress){
			global.progress = global.CURRENT_LEVEL+1;
	}
	//create a save file
	var save_file = "savedata.sav";
	//store level progress in json format
	var json = json_stringify(global.progress);
	//allocate memory for saving
	var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
	
	//write to memory
	buffer_write(buffer, buffer_string, json);
	//save memory to file
	buffer_save(buffer, save_file);
	//delete allocated memory to eliminate memory leaks
	buffer_delete(buffer);
}
	
function loadGame(){
	
	//find save file
	var save_file = "savedata.sav";
	//If no save data, exit function
	if !file_exists(save_file) exit;
	
	//load save file to memory
	var buffer = buffer_load(save_file);
	//read what's in memory to json format
	var json = buffer_read(buffer, buffer_string);
	//delete allocated memory
	buffer_delete(buffer);
	
	//load level progress from save file
	var load = json_parse(json);
	
	//Set game data to what is in save file
	global.progress = load;
}