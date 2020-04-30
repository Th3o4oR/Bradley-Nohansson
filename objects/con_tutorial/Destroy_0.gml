/// @desc 

//Kill tutorial
with (obj_player) has_control = true;
with (con_camera)
{
	zoom_control = true;
	cam_off_control = true;
}
slide_transition(TRANS_MODE.INTRO);