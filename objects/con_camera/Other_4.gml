/// @desc 

if (global.previous_room == room) global.enable_tutorial = false;

view_enabled = true;
view_visible[0] = true;

var _w = con_display.ideal_width;
var _h = con_display.ideal_height;
zoom_control = true;
zoom = 1;
camera_set_view_size(VIEW, _w, _h);
display_set_gui_size(VIEW_W, VIEW_H);
//surface_resize(application_surface, _w*con_display.window_scale, _h*con_display.window_scale);

switch (room)
{
	case (rm_init):
	case (rm_menu):
	{
		break;
	}
	
	case (rm_level_end):
	{
		//NEED TO INITIATE VARIABLES BEFORE CREATING INSTANCES
		cam_state = CAM_STATE.GO_TO_SMOOTH_FOLLOW;
		zoom_control = false;
		zoom = max_zoom_in;
		cam_off_y = con_transition.cutscene_bar_height * 0.5 * VIEW_H * zoom;
		cam_off_control = false;
		
		var _tutorial_state = global.enable_tutorial;
		global.enable_tutorial = true;
		instance_create_layer(0, 0, "Control", con_tutorial);
		global.enable_tutorial = _tutorial_state;
		break;
	}
	
	default: //ALL LEVELS, MAKE SURE TO EXCLUDE POTENTIAL OTHER ROOMS
	{
		//NEED TO INITIATE VARIABLES BEFORE CREATING INSTANCES
		cam_state = CAM_STATE.GO_TO_SMOOTH_FOLLOW;
		zoom_control = false;
		zoom = max_zoom_in;
		cam_off_y = con_transition.cutscene_bar_height * 0.5 * VIEW_H * zoom;
		cam_off_control = false;
		instance_create_layer(0, 0, "Control", con_tutorial);
		break;
	}
}