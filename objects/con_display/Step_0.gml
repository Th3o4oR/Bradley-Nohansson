/// @desc 

//if (keyboard_check_pressed(ord("Z")))
//{
//	window_scale = (window_scale+1 > window_max_scale) ? 1 : window_scale + 1;
//	window_set_size(ideal_width*window_scale, ideal_height*window_scale);
//	//show_message(window_scale);
//	if (TRUE_RES) surface_resize(application_surface, ideal_width*window_scale, ideal_height*window_scale); //Enable "sub-pixels"
//	CENTER_WINDOW;
//}

////Fullscreen switching
if (global.fullscreen != window_get_fullscreen())
{
	window_set_fullscreen(global.fullscreen);
	if (!global.fullscreen)
	{
		if (TRUE_RES) surface_resize(application_surface, ideal_width*window_scale, ideal_height*window_scale);
	}
}

//log(mouse_x, mouse_y); //Mouse coordinates don't update when window resizes!