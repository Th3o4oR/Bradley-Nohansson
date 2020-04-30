/// @desc 

if (instance_exists(obj_player)) && (obj_player.aim_option == AIM_OPTION.MIDDLE_DRAG)
{
	if (!mouse_check_button(mb_left)) window_mouse_set(WINDOW_W/2, WINDOW_H/2);
}