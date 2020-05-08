/// @desc 

if (instance_exists(obj_player)) obj_player.has_control = false;

//Next line
if (keyboard_check_pressed(vk_space))
{
	if (change_text) text_alpha = 0;
	else if (letters >= length) change_text = true;
	else if (current_line < ds_list_size(tutorial_text)) letters = string_length(tutorial_text[| current_line]);
}
else if (keyboard_check(vk_enter))
{
	instance_destroy();
	exit;
}

//Fade out current text
if (change_text)
{
	text_alpha = lerp(text_alpha, 0, alpha_lerp);
	if (text_alpha <= 0)
	{
		text_alpha = 1;
		change_text = false;
		
		//Change actual text being displayed
		if (current_line+1 == ds_list_size(tutorial_text)) instance_destroy();
		else
		{
			current_line ++;
			letters = 0;
			length = string_length(tutorial_text[| current_line]);
			text = "";
			//text_x = GUI_W/2 - string_width_ext(endtext[current_line], -1, GUI_W-(xbuffer*2))/2; //Determine drawing position
		}
	}
}
else if (current_line < ds_list_size(tutorial_text))
{
	//Progress text
	letters += spd;
	text = string_copy(tutorial_text[| current_line], 1, floor(letters));
}