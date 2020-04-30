/// @desc 

var _vx = VIEW_X;
var _vy = VIEW_Y;
var _vw = VIEW_W;
var _vh = VIEW_H;

if (zoom_control) zoom = lerp(zoom, max_zoom_out, zoom_return_spd);
var _cw = con_display.ideal_width; //cam-width
var _ch = con_display.ideal_height; //cam-height
camera_set_view_size(VIEW, _cw*zoom, _ch*zoom);

switch (cam_state)
{
	#region //SMOOTH FOLLOW
	case (CAM_STATE.SMOOTH_FOLLOW):
	{
		if (instance_exists(following))
		{
			_vx = lerp(_vx, following.x-(_vw/2), follow_amount);
			_vy = lerp(_vy, following.y-(_vh/2), follow_amount);
		}
		break;
	}
	#endregion
	#region //GO TO SMOOTH FOLLOW
	case (CAM_STATE.GO_TO_SMOOTH_FOLLOW):
	{
		if (instance_exists(following))
		{
			_vx = following.x - VIEW_W/2;
			_vy = following.y - VIEW_H/2;
			cam_state = CAM_STATE.SMOOTH_FOLLOW;
		}
		break;
	}
	#endregion
	#region //Peek
	case (CAM_STATE.PEEK):
	{
		if (instance_exists(following))
		{
			_vx = lerp(_vx, following.x-(_vw/2), follow_amount);
			_vy = lerp(_vy, following.y-(_vh/2), follow_amount);
			_vx = lerp(_vx+(_vw/2), mouse_x, peek_amount) - (_vw/2);
			_vy = lerp(_vy+(_vh/2), mouse_y, peek_amount) - (_vh/2);
		}
		break;
	}
	#endregion
	#region //Peek
	case (CAM_STATE.OPPOSITE_PEEK):
	{
		if (instance_exists(following))
		{
			_vx = lerp(_vx, following.x-(_vw/2), follow_amount);
			_vy = lerp(_vy, following.y-(_vh/2), follow_amount);
			_vx = lerp(_vx+_vw/2, _vx+_vw/2-(con_hud.crosshair_pos_x-mouse_x), -opposite_peek_amount) - (_vw/2);
			_vy = lerp(_vy+_vh/2, _vy+_vh/2-(con_hud.crosshair_pos_y-mouse_y), -opposite_peek_amount) - (_vh/2);
		}
		break;
	}
	#endregion
}

//Add offset
_vx += cam_off_x;
_vy += cam_off_y;

//Clamp within room
_vx = clamp(_vx, TILESIZE, room_width-_vw-TILESIZE);
_vy = clamp(_vy, TILESIZE, room_height-_vh-TILESIZE);

//Screen shake
_vx += random_range(-shake_magnitude, shake_magnitude);
_vy += random_range(-shake_magnitude, shake_magnitude);
shake_magnitude = max(0, shake_magnitude-((1/shake_duration)*shake_magnitude_init));

camera_set_view_pos(VIEW, _vx, _vy);