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
	
	var _hi_held = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var _hi_pressed = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
	//var _hi_released = keyboard_check_released(ord("D")) - keyboard_check_released(ord("A"));
	
	switch (_dsgrid[# 1, menu_option[page]])
	{
		case (MENU_ACTION.SLIDER):
		{
			if (_hi_held != 0) _dsgrid[# 3, menu_option[page]] = clamp(_dsgrid[# 3, menu_option[page]] + (_hi_held*0.01), 0, array_length_1d(_dsgrid[# 4, menu_option[page]])-1);
			//if (_hi_released != 0) && (_hi_held == 0) activated = true;
			break;
		}
		case (MENU_ACTION.SHIFT):
		{
			_dsgrid[# 3, menu_option[page]] += _hi_pressed;
			_dsgrid[# 3, menu_option[page]] = clamp(_dsgrid[# 3, menu_option[page]], 0, array_length_1d(_dsgrid[# 4, menu_option[page]])-1); //Wraps the value
			break;
		}
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
		//Run script
		case (MENU_ACTION.RUN_SCRIPT):
		{
			var _scr = _dsgrid[# 2, menu_option[page]];
			var _arg = _dsgrid[# 3, menu_option[page]];
			script_execute(menu_perform_action, _scr, _arg);
			break;
		}
		
		//Page transfer
		case (MENU_ACTION.PAGE_TRANSFER):
		{
			page = _dsgrid[# 2, menu_option[page]];
			//var _new_grid = menu_pages[page];
			//if (_new_grid[# 1, 0] != MENU_TYPE.RUN_SCRIPT) && (_new_grid[# 1, 0] != MENU_TYPE.PAGE_TRANSFER) menu_option[page] = 0;
			//x_offset[page, menu_option[page]] = x_offset_default + x_offset_bonus; //Selected option is fully indented when switching page
			break;
		}
		
		//Changing settings
		case (MENU_ACTION.SHIFT):
		case (MENU_ACTION.SLIDER):
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