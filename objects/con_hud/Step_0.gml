/// @desc 

global.point_scale = lerp(global.point_scale, 1, 0.1);

#region //Update crosshair
if (instance_exists(obj_player)) switch (obj_player.aim_option)
{
	case (AIM_OPTION.MIDDLE_DRAG):
	{
		crosshair_pos_x = GUI_W/2;
		crosshair_pos_y = GUI_H/2;
		break;
	}
	case (AIM_OPTION.CLICK_DRAG):
	{
		var _x = ((mouse_check_button(mb_left)) && (obj_player.ball_charge > obj_player.ball_charge_min)) ? VIEW_X+obj_player.orig_mx : mouse_x;
		var _y = ((mouse_check_button(mb_left)) && (obj_player.ball_charge > obj_player.ball_charge_min)) ? VIEW_Y+obj_player.orig_my : mouse_y;
		crosshair_aim_assist = mouse_check_button(mb_left) && (obj_player.ball_charge > obj_player.ball_charge_min);
		crosshair_pos_x = ((mouse_check_button(mb_left)) && (obj_player.ball_charge > obj_player.ball_charge_min)) ? _x : lerp(crosshair_pos_x, _x, crosshair_follow_spd);
		crosshair_pos_y = ((mouse_check_button(mb_left)) && (obj_player.ball_charge > obj_player.ball_charge_min)) ? _y : lerp(crosshair_pos_y, _y, crosshair_follow_spd);
		break;
	}
}

crosshair_anim_loop = mouse_check_button(mb_left);
if (crosshair_image_index > 0) || (crosshair_anim_loop) crosshair_image_index += (crosshair_image_speed * sprite_get_speed(crosshair_sprite)) / game_get_speed(gamespeed_fps);
if (anim_frame_end_ext(sprite_get_number(crosshair_sprite), crosshair_image_index, crosshair_image_speed, crosshair_sprite)) crosshair_image_index = 0;
#endregion