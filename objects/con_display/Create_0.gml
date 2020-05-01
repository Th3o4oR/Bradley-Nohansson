/// @desc 

randomize();

display_w = DISPLAY_W; //Can be changed to check what game would look like at other aspect ratios!
display_h = DISPLAY_H;
aspect_ratio = display_w/display_h;

//Calculate ideal width (or height)
ideal_width = IDEAL_VIEW_W;
ideal_height = IDEAL_VIEW_H;
ideal_width = round(ideal_height * aspect_ratio);
ideal_height = round(ideal_width / aspect_ratio);

//Pixel perfect scaling (changes ideal width and height to be perfect multiples of the monitor size)
//if (display_w mod ideal_width != 0) ideal_width = display_w/round(display_w/ideal_width);
//if (display_h mod ideal_height != 0) ideal_height = display_h/round(display_h/ideal_height);

//Make ideal values even numbers (because odd numbers are bad)
if (ideal_width & 1) ideal_width ++;
if (ideal_height & 1) ideal_height ++;

//Other values
window_max_scale = floor(display_w/ideal_width);
if (ideal_height*window_max_scale == display_h) window_max_scale --;
window_scale = window_max_scale;
//show_message(window_max_scale);
var _load = load_from_file(SAVEFILE, "Settings", "Fullscreen");
global.fullscreen = (_load != undefined) ? _load : FULLSCREEN;

//Calculate different resolutions
global.resolutions = [];
var _scale = power(2, floor(log2(window_max_scale)));
var _i = 0; while (frac(ideal_width*_scale) == 0) && (frac(ideal_height*_scale) == 0)
{
	global.resolutions[_i] = string(ideal_width*_scale) + "x" + string(ideal_height*_scale);
	_scale /= 2;
	_i ++;
}
var _load = load_from_file(SAVEFILE, "Settings", "Resolution");
global.current_res = (_load != undefined) ? _load : 0;

//Setup views in rooms (now happens in con_camera room_start event)

//Appsurf / GUI / Window
if (_load != undefined) menu_perform_action("Resolution", global.current_res);
else surface_resize(application_surface, TRUE_RES?ideal_width*window_scale:ideal_width, TRUE_RES?ideal_height*window_scale:ideal_height);
//display_set_gui_size(ideal_width*window_scale, ideal_height*window_scale); //Enable if gui needs to stay true to the game window
window_set_size(ideal_width*window_scale, ideal_height*window_scale);
CENTER_WINDOW;

instance_create_layer(0, 0, layer, con_camera);
instance_create_layer(0, 0, layer, con_transition);
instance_create_layer(0, 0, layer, con_hud);
room_goto_next(); //Don't wanna stay in the "init" room