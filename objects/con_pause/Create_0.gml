/// @desc 

application_surface_draw_enable(false);

pause_surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
surface_set_target(pause_surf);
draw_clear_alpha(c_black, 1);
surface_reset_target();
surface_copy(pause_surf, 0, 0, application_surface);

text_surf = surface_create(con_display.ideal_width, con_display.ideal_height);
surface_set_target(text_surf);
draw_clear_alpha(c_black, 0);
surface_reset_target();

instance_deactivate_all(true);

//Very basic menu
page = menu_page_create(
	["RESUME",			MENU_ACTION.TOGGLE,		"Pause resume"],
	["QUIT TO MENU",	MENU_ACTION.TOGGLE,		"Return to menu"]
);
//The array below has to correspond to the order of the enumerator of menu pages
menu_pages = [page];
page = 0;
inputting = false; //True when the user is changing a setting
activated = false;
prev_value = 0;
for (var _i = 0; _i < array_length_1d(menu_pages); _i ++) menu_option[_i] = 0; //Which option is selected on the different menu pages, this way the game "remembers" which element you had selected on the previous page when navigating the menu

//Options
slider_len = 32;

//Offset
draw_set_font(fnt_pixelzim);
yoffset = string_height("W"); //Distance between menu elements