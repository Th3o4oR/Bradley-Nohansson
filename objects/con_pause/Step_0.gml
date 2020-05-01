/// @desc 

/// @desc 

var _dsgrid = menu_pages[page];
var _dsheight = ds_grid_height(_dsgrid);

if (inputting)
{
	var _vi_pressed = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	if (_vi_pressed != 0) || (keyboard_check_pressed(vk_escape))
	{
		_dsgrid[# 3, menu_option[page]] = prev_value;
		if (_vi_pressed != 0) menu_option[page] = clamp(menu_option[page] + _vi_pressed, 0, _dsheight-1);
		inputting = false;
	}
	
	switch (_dsgrid[# 1, menu_option[page]])
	{
		case (MENU_ACTION.TOGGLE):
		{
			if (keyboard_check_released(vk_enter))
			{
				_dsgrid[# 3, menu_option[page]] = !_dsgrid[# 3, menu_option[page]];
				activated = true;
			}
			break;
		}
	}
}
else
{
	//Change selected option
	var _vi_pressed = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	if (_vi_pressed != 0) menu_option[page] = clamp(menu_option[page] + _vi_pressed, 0, _dsheight-1);
}

//Activate
if (keyboard_check_pressed(vk_enter)) activated = true;
if (activated)
{
	switch (_dsgrid[# 1, menu_option[page]])
	{
		//Changing settings
		case (MENU_ACTION.TOGGLE):
		{
			if (inputting) script_execute(menu_perform_action, _dsgrid[# 2, menu_option[page]], _dsgrid[# 3, menu_option[page]]);
			else prev_value = _dsgrid[# 3, menu_option[page]];
			inputting = !inputting;
			break;
		}
	}
	activated = false;
}