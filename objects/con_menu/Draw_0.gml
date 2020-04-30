/// @desc 

var _dsgrid = menu_pages[page];
var _dsheight = ds_grid_height(_dsgrid)

var _x_start = VIEW_X + VIEW_W/2;
var _y_start = (VIEW_Y + VIEW_H/2) - (_dsheight-1)*yoffset/2;
for (var _i = 0; _i < _dsheight; _i ++) if (_dsgrid[# 1, _i] != MENU_ACTION.PAGE_TRANSFER) && (_dsgrid[# 1, _i] != MENU_ACTION.RUN_SCRIPT) _y_start -= yoffset/2; //Loop through, increase height if any are options

var _c = c_black;
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_pixelzim);

#region //Menu text
var _y_extra = 0;
for (var _i = 0; _i < _dsheight; _i ++)
{
	var _text_x = _x_start;
	var _text_y = _y_start + (_i * yoffset) + _y_extra;
	
	//Draw "header"
	_c = c_white;
	if (_i == menu_option[page])
	{
		if (inputting) _c = c_orange;
		else _c = c_yellow;
	}
	draw_text_colour(_text_x, _text_y, _dsgrid[# 0, _i], _c,_c,_c,_c, 1);
	
	//Draw "option"
	//Add buffer when an option should be displayed underneath
	if (_dsgrid[# 1, _i] != MENU_ACTION.PAGE_TRANSFER) && (_dsgrid[# 1, _i] != MENU_ACTION.RUN_SCRIPT)
	{
		_y_extra += yoffset;
		var _option_x = _text_x + 8; //8 = buffer
		var _option_y = _text_y + yoffset;
		var _val = _dsgrid[# 3, _i];
		if (is_array(_dsgrid[# 4, _i])) var _array = _dsgrid[# 4, _i];
		
		if (!inputting) _c = c_black;
		
		//Actual drawing of options
		switch (_dsgrid[# 1, _i])
		{
			#region //Shift
			case (MENU_ACTION.SHIFT):
			{
				//Every option is determined by the longest word in all the "shifts" on the page
				var _len = 0;
				for (var _ii = 0; _ii < _dsheight; _ii ++)
				{
					if (_dsgrid[# 1, _ii] == MENU_ACTION.SHIFT)
					{
						var _this_array = _dsgrid[# 4, _ii];
						for (var _iii = 0; _iii < array_length_1d(_this_array); _iii ++) if (string_width(_this_array[_iii]) > _len) _len = string_width(_this_array[_iii]); //Longest of the shifts
					}
				}
			
				_c = (inputting) && (_i == menu_option[page]) ? c_yellow : c_black;
			
				var _draw_x = _option_x;
				if (_val != 0) draw_text_colour(_draw_x, _option_y, "< ", _c,_c,_c,_c, 1);
				_draw_x += string_width("< ");
				if (_val != array_length_1d(_array)-1) draw_text_colour(_draw_x+_len, _option_y, " >", _c,_c,_c,_c, 1);
				
				_c = (inputting) && (_i == menu_option[page]) ? c_white : c_black;
				draw_text_colour(_draw_x+(_len-string_width(_array[_val]))/2, _option_y, _array[_val], _c,_c,_c,_c, 1);
				break;
			}
			#endregion
			#region //Slider
			case (MENU_ACTION.SLIDER):
			{
				var _w = 2;
				var _cur_perc = (_val-_array[0]) / (_array[1]-_array[0]);
				draw_line_width_color(_option_x, _option_y-_w/2, _option_x+slider_len, _option_y-_w/2, _w, c_white,c_white);
				draw_rectangle_colour(_option_x+(_cur_perc*slider_len)-_w/2, _option_y-_w*1.5, _option_x+(_cur_perc*slider_len)+_w/2, _option_y, _c,_c,_c,_c, false);
				draw_text_colour(_option_x+slider_len+4, _option_y, string(round(_cur_perc*100))+"%", _c,_c,_c,_c, 1);
				break;
			}
			#endregion
			#region //Toggle
			case (MENU_ACTION.TOGGLE):
			{
				var _c = c_black;
				if (!is_array(_dsgrid[# 4, _i])) var _array = ["ON", "OFF"];
				var _text = _array[_val];
			
				draw_text_colour(_option_x, _option_y, _text, _c,_c,_c,_c, 1);
				break;
			}
			#endregion
		}
	}
}
#endregion

#region //Menu buttons
var _menu_keys = ["W", "A", "S", "D"];
var _w = sprite_get_width(spr_menu_key_frame);
var _pos = [_w,-_w, 0,0, _w,0, 2*_w,0]; //W, A, S, D relative positions
var _scale = 2;
//draw_set_halign(fa_middle);
//draw_set_valign(fa_middle);
for (var _i = 0; _i < array_length_1d(_menu_keys); _i ++)
{
	var _x = _x_start - VIEW_W/4 - _w*5  + _pos[_i*2]*_scale;
	var _y = VIEW_Y + VIEW_H/2 + _pos[(_i*2)+1]*_scale;
	
	var _image = keyboard_check(ord(_menu_keys[_i]));
	draw_sprite_ext(spr_menu_key_frame, _image, _x, _y, _scale, _scale, 0, c_white, 1);
	//draw_text_transformed(_x+3, _y+3, _menu_keys[_i], 1, 1, 0);
}
var _image = keyboard_check(vk_enter);
draw_sprite_ext(spr_enter_key_frame, _image, _x+(2*_w*_scale), VIEW_Y+(VIEW_H/2)-(sprite_get_height(spr_enter_key_frame)/2*_scale), _scale, _scale, 0, c_white, 1);
#endregion