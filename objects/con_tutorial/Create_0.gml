/// @desc 

#region //Tutorial text
tutorial_text = ds_list_create();
switch (room)
{
	case (rm_level_1):
	{
		ds_list_add(tutorial_text, "Hello there!");
		ds_list_add(tutorial_text, "I'm going to make this real simple.");
		ds_list_add(tutorial_text, "To get started, move around.");
		break;
	}
	
	case (rm_level_2):
	{
		ds_list_add(tutorial_text, "It's a ball!");
		ds_list_add(tutorial_text, "I wonder what you can do with that."); //Longest string possible
		ds_list_add(tutorial_text, "What are you still doing here?");
		break;
	}
	
	case (rm_level_3):
	{
		ds_list_add(tutorial_text, "This one is tough.");
		ds_list_add(tutorial_text, "Ball.");
		ds_list_add(tutorial_text, "Goes.");
		ds_list_add(tutorial_text, "Between.");
		ds_list_add(tutorial_text, "The.");
		ds_list_add(tutorial_text, "Bars.");
		break;
	}
	
	default:
	{
		with (con_camera)
		{
			zoom_control = true;
			zoom = max_zoom_out;
			cam_off_y = 0;
		}
		with (obj_player) has_control = true;
		slide_transition(TRANS_MODE.INTRO);
		instance_destroy(id, false);
		exit;
	}
}
#endregion

//Text
spd = 0.5;
letters = 0;
text = "";
current_line = 0;
length = string_length(tutorial_text[| current_line]);
font = fnt_pixelzim;
xbuffer = 32;

change_text = false;
//text_x = GUI_W/2 - string_width_ext(endtext[current_line], -1, GUI_W-(xbuffer*2))/2; //Determine drawing position

//Alpha
instruction_alpha = 0;
text_alpha = 1;
alpha_lerp = 0.25;