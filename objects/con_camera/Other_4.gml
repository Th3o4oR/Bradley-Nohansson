/// @desc 

view_enabled = true;
view_visible[0] = true;

var _w = con_display.ideal_width;
var _h = con_display.ideal_height;
camera_set_view_size(VIEW, _w, _h);
display_set_gui_size(VIEW_W, VIEW_H);
//surface_resize(application_surface, _w*con_display.window_scale, _h*con_display.window_scale);

switch (room)
{
	case (rm_level_1):
	case (rm_level_2):
	case (rm_level_3):
	case (rm_level_infinite):
	{
		//NEED TO INITIATE VARIABLES BEFORE CREATING INSTANCES
		cam_state = CAM_STATE.GO_TO_SMOOTH_FOLLOW;
		zoom_control = false;
		zoom = max_zoom_in;
		cam_off_y = con_transition.cutscene_bar_height * 0.5 * VIEW_H * zoom;
		cam_off_control = false;
		slide_transition(TRANS_MODE.CUTSCENE);
		instance_create_layer(0, 0, layer, con_hud);
		instance_create_layer(0, 0, layer, con_tutorial);
		break;
	}
}