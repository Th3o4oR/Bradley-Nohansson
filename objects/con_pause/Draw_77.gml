/// @desc 

var _pos = application_get_position();
shader_set(shd_grayscale);
draw_surface_stretched(pause_surf, _pos[0], _pos[1], _pos[2]-_pos[0], _pos[3]-_pos[1]);
shader_reset();

#region //Menu text
var _dsgrid = menu_pages[page];
var _dsheight = ds_grid_height(_dsgrid)

var _x_start = surface_get_width(text_surf)/2;
var _y_start = surface_get_height(text_surf)/2 - (_dsheight-1)*yoffset/2;

draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fnt_pixelzim);
surface_set_target(text_surf);

for (var _i = 0; _i < _dsheight; _i ++)
{
	var _text_x = _x_start;
	var _text_y = _y_start + (_i * yoffset);
	
	//Draw "header"
	_c = c_white;
	if (_i == menu_option[page])
	{
		if (inputting) _c = c_orange;
		else _c = c_yellow;
	}
	draw_text_colour(_text_x, _text_y, _dsgrid[# 0, _i], _c,_c,_c,_c, 1);
}
surface_reset_target();

draw_surface_stretched(text_surf, _pos[0], _pos[1], _pos[2]-_pos[0], _pos[3]-_pos[1]);
#endregion

