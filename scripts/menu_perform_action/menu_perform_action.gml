/// @desc menu_perform_action
/// @arg menu_action
/// @arg values (array)

var _action = argument0;
var _value = argument1; //Array or single value

switch (_action)
{
	case ("Play"):
	{
		//instance_create_layer(0, 0, layer, con_hud);
		con_transition.cutscene_bar_height = con_transition.cutscene_bar_height_init;
		slide_transition(TRANS_MODE.NEXT);
		var _load = load_from_file(SAVEFILE, SAVE_DATA, "Tutorial");
		if (_load == undefined) || (_load == true) global.enable_tutorial = true;
		else global.enable_tutorial = false;
		save_to_file(SAVEFILE, SAVE_DATA, "Tutorial", true);
		break;
	}
	
	case ("Master volume"):
	{
		audio_master_gain(_value);
		save_to_file(SAVEFILE, SAVE_SETTING, "Master volume", _value);
		break;
	}
	
	case ("Fullscreen"):
	{
		global.fullscreen ^= true; //XOR -> flips boolean: 1 xor 1 = false, 0 xor 1 = true
		save_to_file(SAVEFILE, SAVE_SETTING, "Fullscreen", global.fullscreen);
		break;
	}
	
	case ("Resolution"):
	{
		var _w = con_display.ideal_width;
		var _h = con_display.ideal_height;
		var _scale = power(2, floor(log2(con_display.window_max_scale))) / power(2, _value);
		surface_resize(application_surface, _w*_scale, _h*_scale);
		//window_set_size(_w*_scale, _h*_scale);
		//CENTER_WINDOW;
		save_to_file(SAVEFILE, SAVE_SETTING, "Resolution", _value);
		break;
	}
	
	case ("Erase"):
	{
		if (file_exists(SAVEFILE)) file_delete(SAVEFILE);
		break;
	}
	
	case ("Quit"):
	{
		game_end();
		break;
	}
	
	//Pause menu
	case ("Pause resume"):
	{
		with (con_pause) event_perform(ev_other, ev_user0);
		break;
	}
	
	case ("Return to menu"):
	{
		with (con_pause) event_perform(ev_other, ev_user0);
		slide_transition(TRANS_MODE.GOTO, rm_menu);
		break;
	}
}