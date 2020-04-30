/// @desc 

var _onground = place_meeting(x, y+1, par_static);

if (has_control)
{
	var _hi = keyboard_check(ord("D")) - keyboard_check(ord("A")); //H-input
	var _jump_pressed = keyboard_check_pressed(ord("W"));
}
else
{
	var _hi = 0;
	var _jump_pressed = 0;
}

switch (player_state)
{
	#region //IDLE
	case (STATE.IDLE):
	{
		if (state_new)
		{
			hsp = 0;
			vsp = 0;
			image_speed = 1;
			image_index = 0;
			sprite_index = spr_player_idle_v2;
		}
		
		//Possible jump
		if ((_jump_pressed) && (_onground)) || (!_onground)
		{
			if (_onground)
			{
				vsp = -jumpspd
				jumped = true;
			}
			player_state = STATE.AIR;
			break;
		}
		
		//Run
		if (_hi != 0) && (!place_meeting(x+_hi, y, par_static))
		{
			player_state = STATE.RUN;
			break;
		}
		break;
	}
	#endregion
	#region //RUN
	case (STATE.RUN):
	{
		if (state_new)
		{
			sprite_index = spr_player_run_leaning_opt;
			image_index = 0;
			image_speed = 0.5;
			
			if (hsp < hsp_array[0]) hsp_index = 0;
			else
			{
				//Determine speed to continue running
				var _i = 0; repeat (array_length_1d(hsp_array))
				{
					if (abs(hsp) > hsp_array[_i]) hsp_index = _i;
					_i ++;
				}
			}
		}
		
		if (_onground) jump_buffer = jump_buffer_init;
		
		//Possible jump
		if ((_jump_pressed) && (_onground)) || (!_onground)
		{
			if (_onground)
			{
				vsp = -jumpspd
				jumped = true;
				jump_buffer = 0;
			}
			player_state = STATE.AIR;
		}
		else if (_hi != 0) //Accelerate!
		{
			if (_hi != sign(hsp)) && (abs(hsp) > hsp_proxim_buffer) player_state = STATE.SLOW; //Slow down
			else
			{
				if (hsp_array[hsp_index] - abs(hsp) < hsp_proxim_buffer) && (_onground) //Accelerate!
				{
					hsp_index = min(array_length_1d(hsp_array)-1, hsp_index+1);
				}
				hsp = lerp(hsp, hsp_array[hsp_index]*_hi, hsp_accel[hsp_index]);
			}
		}
		else player_state = STATE.SLOW;
		
		if (hsp != 0)
		{
			image_xscale = sign(hsp);
			image_speed = new_range(abs(hsp), 0, hsp_array[array_length_1d(hsp_array)-1], 0, 1);
		}
		
		//Horizontal collisions
		if (place_meeting(x+(abs(hsp)>1 ? hsp : sign(hsp)), y, par_static))
		{
			x = (hsp > 0) ? floor(x) : ceil(x);
			while (!place_meeting(x+sign(hsp), y, par_static)) x += sign(hsp);
			player_state = STATE.IDLE;
			hsp = 0;
		}
		x += hsp;
		break;
	}
	#endregion
	#region //SLOW (Down)
	case (STATE.SLOW):
	{
		if (state_new)
		{
			sprite_index = spr_player_brake_col;
			image_index = 0;
			image_speed = 1;
		}
		
		if (_onground) jump_buffer = jump_buffer_init;
		
		if ((_jump_pressed) && (_onground)) || (!_onground)
		{
			if (_onground)
			{
				vsp = -jumpspd;
				jumped = true;
				jump_buffer = 0;
			}
			player_state = STATE.AIR;
		}
		else if (_hi != 0) //Slowing down
		{
			if (abs(hsp) <= hsp_proxim_buffer) || (_hi == sign(hsp)) player_state = STATE.RUN;
			else hsp = lerp(hsp, 0, hsp_decel[hsp_index]);
		}
		else
		{
			if (abs(hsp) <= hsp_proxim_buffer)
			{
				player_state = STATE.IDLE;
				break; //Don't need movement or collisions after switching to IDLE
			}
			else hsp = lerp(hsp, 0, hsp_decel[array_length_1d(hsp_decel)-1]);
		}
		
		var _range = new_range(abs(hsp), 0, hsp_array[array_length_1d(hsp_decel)-1], 0.25, 0.75);
		if (random(1) < _range)
		{
			var _side = (hsp > 0) ? bbox_right : bbox_left;
			with (instance_create_depth(_side, bbox_bottom, depth-1, obj_dust))
			{
				hsp = random_range(other.hsp, other.hsp*2);
				vsp = random_range(0, 0.1);
			}
		}
		
		//Horizontal collisions
		if (place_meeting(x+(abs(hsp)>1 ? hsp : sign(hsp)), y, par_static))
		{
			x = (hsp > 0) ? floor(x) : ceil(x);
			while (!place_meeting(x+sign(hsp), y, par_static)) x += sign(hsp);
			player_state = STATE.IDLE;
			hsp = 0;
		}
		x += hsp;
		break;
	}
	#endregion
	#region //AIR
	case (STATE.AIR):
	{
		if (state_new)
		{
			sprite_index = spr_player_air;
			image_speed = 0;
		}
		image_index = (vsp+grav > 0);
		if (hsp != 0) image_xscale = sign(hsp);
		
		if (_hi != 0) hsp = lerp(hsp, hsp_array[hsp_index]*_hi, hsp_air_accel);
		
		//Vertical
		if (!jumped) && (keyboard_check(ord("W"))) && (jump_buffer > 0)
		{
			vsp = -jumpspd;
			jump_buffer = 0;
			jumped = true;
		}
		if (jumped) && (!keyboard_check(ord("W"))) vsp += jump_counterforce;
		if (vsp > 0) jumped = false;
		jump_buffer = max(0, jump_buffer-1);
		vsp += grav;
		
		//Horizontal collisions
		if (place_meeting(x+(abs(hsp)>1 ? hsp : sign(hsp)), y, par_static))
		{
			x = (hsp > 0) ? floor(x) : ceil(x);
			while (!place_meeting(x+sign(hsp), y, par_static)) x += sign(hsp);
			hsp = 0;
		}
		x += hsp;
		
		//Vertical collision
		if (place_meeting(x, y+(abs(vsp)>1 ? vsp : sign(vsp)), par_static))
		{
			y = (vsp > 0) ? floor(y) : ceil(y);
			while (!place_meeting(x, y+sign(vsp), par_static)) y += sign(vsp);
			if (vsp > 0)
			{
				vsp = 0;
				if (_hi != 0) player_state = STATE.RUN;
				else if (hsp != 0) player_state = STATE.SLOW;
				else player_state = STATE.IDLE;
				break;
			}
			vsp = 0;
		}
		y += vsp;
		break;
	}
	#endregion
}

#region //Ball handling, finally!
if (ball_held != noone)
{
	//Update ball position
	var _id = id;
	with (ball_held)
	{
		phy_position_x = _id.x + _id.ball_offset_x*sign(_id.image_xscale);
		phy_position_y = _id.y + _id.ball_offset_y*sign(_id.image_yscale);
	}
	
	//Throw the ball! (only activate if you press the mouse after you have picked up the ball)
	if (mouse_check_button_pressed(mb_left))
	{
		//Store original click
		orig_mx = mouse_x - VIEW_X;
		orig_my = mouse_y - VIEW_Y;
			
		initiate_ball_charge = false;
	}
	
	//Charge up for a throw
	if (!initiate_ball_charge)
	{
		switch (aim_option)
		{
			case (AIM_OPTION.MIDDLE_DRAG):
			{
				var _dis = clamp(point_distance(VIEW_X+VIEW_W/2, VIEW_Y+VIEW_H/2, mouse_x, mouse_y), 0, ball_drag_dist[aim_option]);
				ball_dir = -point_direction(mouse_x, mouse_x, VIEW_X+VIEW_W/2, VIEW_Y+VIEW_H/2); //Point ball in the right direction
				break;
			}
			case (AIM_OPTION.CLICK_DRAG):
			{
				var _dis = clamp(point_distance(mouse_x, mouse_y, VIEW_X+orig_mx, VIEW_Y+orig_my), 0, ball_drag_dist[aim_option]);
				ball_dir = -point_direction(mouse_x, mouse_y, VIEW_X+orig_mx, VIEW_Y+orig_my); //Point ball in the right direction
				break;
			}
		}
		ball_held.phy_rotation = ball_dir;
		ball_charge = new_range(_dis, 0, ball_drag_dist[aim_option], ball_charge_min, ball_charge_max);
		con_camera.cam_state = CAM_STATE.OPPOSITE_PEEK;
		//with (con_camera) zoom = lerp(max_zoom_out, max_zoom_in, _id.ball_charge); //Zoom in camera
	}
	
	//Actual throw
	if (mouse_check_button_released(mb_left)) && (ball_charge > ball_charge_min)
	{
		var _dir = -ball_dir;
		var _xlen = lengthdir_x(ball_charge, _dir);
		var _ylen = lengthdir_y(ball_charge, _dir);
		with (ball_held)
		{
			phy_active = true;
			physics_apply_impulse(phy_position_x, phy_position_y, _xlen, _ylen);
		}
		//with (con_camera) zoom_control = true; //Return control to camera, which lerps back to normal zoom
		ball_charge = ball_charge_min;
		ball_held = noone;
		ball_thrown = true;
		initiate_ball_charge = true;
		
		con_camera.cam_state = CAM_STATE.SMOOTH_FOLLOW;
	}
}
else if (place_meeting(x, y, obj_ball))
{
	var _ball = instance_place(x, y, obj_ball);
	if (!ball_thrown) && (_ball.phy_speed < ball_charge_min) //Pick up ball if it "didn't go anywhere"
	{
		oopsed = false;
		ball_held = _ball;
		ball_held.phy_active = false;
		ball_held.phy_angular_velocity = 0;
		ball_held.phy_rotation = 0;
		ball_held.phy_speed_x = 0;
		ball_held.phy_speed_y = 0;
	}
	else if (!ball_thrown) && (!oopsed) && (!instance_exists(obj_oops))
	{
		instance_create_depth(x, y-sprite_height, depth+1, obj_oops);
		oopsed = true;
	}
}
else
{
	ball_thrown = false;
	oopsed = false;
}
#endregion

//Refresh state_new
if (player_state_previous != player_state)
{
	player_state_previous = player_state;
	state_new = true;
}
else state_new = false;