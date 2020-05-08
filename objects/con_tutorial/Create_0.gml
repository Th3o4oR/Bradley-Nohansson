/// @desc 

slide_transition(TRANS_MODE.CUTSCENE);
global.pause_timer = true;

#region //Tutorial text
tutorial_text = ds_list_create();
var _room = (global.enable_tutorial == true) ? room : undefined;
switch (_room)
{
	#region //One
	case (rm_level_1):
	{
		ds_list_add(tutorial_text, "So... this is him.");
		ds_list_add(tutorial_text, "This is who they call...");
		ds_list_add(tutorial_text, "Bradley Nohansson.");
		ds_list_add(tutorial_text, "Does he have arms? Who knows.");
		ds_list_add(tutorial_text, "He certainly doesn't use them.");
		ds_list_add(tutorial_text, "Enough niceties.");
		ds_list_add(tutorial_text, "Listen.\nIt's very simple.");
		ds_list_add(tutorial_text, "To get started, move around.");
		ds_list_add(tutorial_text, "And always remember:");
		ds_list_add(tutorial_text, "If you ever get stuck...");
		ds_list_add(tutorial_text, "And need someone to help you out...");
		ds_list_add(tutorial_text, "Forget it.");
		ds_list_add(tutorial_text, "(Also you can press the \"Escape\" button)");
		break;
	}
	#endregion
	#region //Two
	case (rm_level_2):
	{
		ds_list_add(tutorial_text, "It's a ball!");
		ds_list_add(tutorial_text, "*magic*");
		ds_list_add(tutorial_text, "I wonder what you can do with that."); //Longest string possible
		ds_list_add(tutorial_text, "Will the oh so legenda-");
		ds_list_add(tutorial_text, "What's that now?");
		ds_list_add(tutorial_text, "Fine.\nBe that way.");
		break;
	}
	#endregion
	#region //Three
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
	#endregion
	#region //Four
	case (rm_level_4):
	{
		ds_list_add(tutorial_text, "At last! A challenge");
		ds_list_add(tutorial_text, "This time... oh, this time.");
		ds_list_add(tutorial_text, "Considering the ti-");
		ds_list_add(tutorial_text, "Nevermind, do your best.");
		break;
	}
	#endregion
	#region //Five
	case (rm_level_5):
	{
		ds_list_add(tutorial_text, "I think you'll enjoy this one.");
		ds_list_add(tutorial_text, "I made it just for you ;)");
		ds_list_add(tutorial_text, "*wink*");
		break;
	}
	#endregion
	#region //Six
	case (rm_level_6):
	{
		ds_list_add(tutorial_text, "Could it be?");
		ds_list_add(tutorial_text, "No, that'd defy all of creation.");
		ds_list_add(tutorial_text, "Oh... you're still here.");
		break;
	}
	#endregion
	#region //Seven
	case (rm_level_7):
	{
		ds_list_add(tutorial_text, "Woah, the ground left!");
		ds_list_add(tutorial_text, "I'd do that too.");
		ds_list_add(tutorial_text, "Can't you do this any faster?");
		break;
	}
	#endregion
	#region //End
	case (rm_level_end):
	{
		with (con_camera)
		{
			zoom = 0.75;
			cam_off_y = con_transition.cutscene_bar_height * 0.5 * VIEW_H * zoom;
		}
		ds_list_add(tutorial_text, "You actually made it.");
		ds_list_add(tutorial_text, "You got to the end.");
		ds_list_add(tutorial_text, "How can this be?");
		ds_list_add(tutorial_text, "Questions like these bother me.");
		ds_list_add(tutorial_text, "Is there something wrong...");
		ds_list_add(tutorial_text, "Something fundamentally wrong...");
		ds_list_add(tutorial_text, "With the universe?");
		ds_list_add(tutorial_text, "Maybe. But then again, maybe not.");
		ds_list_add(tutorial_text, "Anyway.");
		ds_list_add(tutorial_text, "Congratulations.");
		ds_list_add(tutorial_text, "You made it to the end.");
		ds_list_add(tutorial_text, "Does that feel good?");
		ds_list_add(tutorial_text, "It should.");
		ds_list_add(tutorial_text, "Thank you for playing!");
		ds_list_add(tutorial_text, "Chicken Turkey Productions.");
		break;
	}
	#endregion
	
	#region //Default
	default:
	{
		global.pause_timer = false;
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
	#endregion
}
#endregion

//Text
spd = 0.5;
letters = 0;
text = "";
current_line = 0;
length = string_length(tutorial_text[| current_line]);
font = fnt_pixelzim;
xbuffer = 4;
restart = false;

change_text = false;
//text_x = GUI_W/2 - string_width_ext(endtext[current_line], -1, GUI_W-(xbuffer*2))/2; //Determine drawing position

//Alpha
instruction_alpha = 0;
text_alpha = 1;
alpha_lerp = 0.25;