/// @desc 

//Kill tutorial
if (room != rm_level_end) global.pause_timer = false;
with (obj_player) has_control = true;
with (con_camera)
{
	zoom_control = true;
	cam_off_control = true;
}
if (restart)
{
	//global.points = global.room_start_points;
	slide_transition(TRANS_MODE.GOTO, room);
}
else slide_transition(TRANS_MODE.INTRO);