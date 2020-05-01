///// @desc 

////Proper code
//if (ds_list_size(active_hacks) > 0) && (!auto_draw_app_surf)
//{
//	var _cam_w = VIEW_W;
//	var _cam_h = VIEW_H;
	
//	//Prepare surface
//	if (!surface_exists(main_surface)) main_surface = surface_create(_cam_w, _cam_h);
//	if (!surface_exists(temp_surface)) temp_surface = surface_create(_cam_w, _cam_h);
	
//	surface_set_target(main_surface);
//	draw_clear_alpha(c_black, 1);
//	draw_surface_stretched(application_surface, 0, 0, _cam_w, _cam_h); //Draw the application surface to the main surface
//	surface_reset_target();
	
//	surface_set_target(temp_surface);
//	draw_surface_stretched(main_surface, 0, 0, _cam_w, _cam_h);
//	draw_clear_alpha(c_black, 1);
//	surface_reset_target();

//	for (var _i = 0; _i < ds_list_size(active_hacks); _i ++)
//	{
//		var _hack_index = active_hacks[| _i];
//		var _hack_type = hack_info[# 1, _hack_index];
	
//		if (_hack_type == HACK_EVENTS.POST_DRAW)
//		{
//			//Draw to the temporary surface so it contains the proper data
//			surface_set_target(temp_surface);
//			draw_surface_stretched(main_surface, 0, 0, _cam_w, _cam_h);
//			surface_reset_target();
			
//			var _hack_script = hack_info[# 2, _hack_index];
//			if (hack_info[# 3, _hack_index] != 0) script_execute(_hack_script, hack_info[# 3, _hack_index]);
//			else script_execute(_hack_script);
//		}
//	}
	
//	//Draw surface to the screen, then destroy it
//	var _pos = application_get_position();
//	draw_surface_stretched(main_surface, _pos[0], _pos[1], _pos[2]-_pos[0], _pos[3]-_pos[1]);
//}