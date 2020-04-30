/// @desc 

//Camera states
enum CAM_STATE
{
	SMOOTH_FOLLOW,
	GO_TO_SMOOTH_FOLLOW,
	PEEK,
	OPPOSITE_PEEK,
	
	LAST
}
cam_state = CAM_STATE.GO_TO_SMOOTH_FOLLOW;
following = obj_player;

follow_amount = 0.1;
peek_amount = 0.02; //Lower prefers target, higher prefers mouse
opposite_peek_amount = 0.05;

//Zoom
zoom = 1;
max_zoom_out = 1;
max_zoom_in = 0.75;
zoom_control = true;
zoom_return_spd = 0.1;
cam_off_x = 0;
cam_off_y = 0;

//Screen shake
shake_duration = 0;
shake_magnitude_init = 0;
shake_magnitude = 0;
//shake_padding = 16; 