/// @desc menu_perform_action
/// @arg menu_action
/// @arg values (array)

var _action = argument0;
var _value = argument1; //Array or single value

switch (_action)
{
	case ("Play"):
	{
		instance_create_layer(0, 0, layer, con_hud);
		room_goto_next();
		break;
	}
	
	case ("Master volume"):
	{
		audio_master_gain(_value);
		save_to_file(SAVEFILE, "Settings", "Master volume", _value);
		break;
	}
	
	case ("Fullscreen"):
	{
		global.fullscreen ^= true; //XOR -> flips boolean: 1 xor 1 = false, 0 xor 1 = true
		save_to_file(SAVEFILE, "Settings", "Fullscreen", global.fullscreen);
		break;
	}
	
	case ("Resolution"):
	{
		var _w = con_display.ideal_width;
		var _h = con_display.ideal_height;
		var _scale = power(2, floor(log2(con_display.window_max_scale))) / power(2, _value);
		surface_resize(application_surface, _w*_scale, _h*_scale);
		save_to_file(SAVEFILE, "Settings", "Resolution", _value);
		break;
	}
	
	case ("Quit"):
	{
		game_end();
		break;
	}
}