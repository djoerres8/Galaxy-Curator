//Create menu variables

//Menu setup
//get GUI dimensions and set margin
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32; //to change later

//set location of menu, to change later
menu_x = gui_width + 200;  
menu_y = gui_height - gui_margin;

//set menu font
menu_font = font_menu;
menu_itemheight = font_get_size(font_menu);

//tracking menu selection and if player can interact with menu
menu_committed = -1;
menu_control = true;

//Menu options
menu[4] = "New Game";
menu[3] = "Continue";
menu[2] = "Level Select";
menu[1] = "Options"
menu[0] = "Quit";

menu_items = array_length(menu);
menu_cursor = 4;