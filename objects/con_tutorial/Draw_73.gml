/// @description

//Black rectangles
//draw_set_colour(c_black);
//draw_rectangle(0, 0, GUI_W, GUI_H/4, false);
//draw_rectangle(0, GUI_H-GUI_H/4, GUI_W, GUI_H, false);

//Actual text
if (current_line < ds_list_size(tutorial_text))
{
	var _w = con_display.ideal_width * con_camera.max_zoom_in;
	var _h = con_display.ideal_height * con_camera.max_zoom_in;
	var _surf = surface_create(_w, _h);
	surface_set_target(_surf);
	draw_clear_alpha(c_black, 0);
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_top);
	draw_set_colour(c_black);
	draw_set_font(font);
	var _c = c_white;
	draw_text_ext_transformed_color(_w/2, _h*0.05, text, -1, _w*2, 0.5, 0.5, 0, _c,_c,_c,_c, text_alpha);
	//draw_text_transformed_color(text_x, xbuffer, text, -1, GUI_W-(xbuffer*2), 1, 1, 0, c_black, c_white, 2, text_alpha);

	//Info/Instructions
	var _text = "(PRESS SPACE)";
	if (letters >= length) && (text_alpha >= 1) instruction_alpha = lerp(instruction_alpha, 1, alpha_lerp);
	else instruction_alpha = lerp(instruction_alpha, 0, alpha_lerp);

	draw_set_valign(fa_bottom);
	draw_text_ext_transformed_color(_w/2, _h*0.95, _text, -1, _w*2, 0.5, 0.5, 0, _c,_c,_c,_c, instruction_alpha);
	
	surface_reset_target();
	
	//var _pos = application_get_position();
	//draw_surface_stretched(_surf, _pos[0], _pos[1], _pos[2]-_pos[0], _pos[3]-_pos[1]);
	draw_surface_stretched(_surf, VIEW_X, VIEW_Y, VIEW_W, VIEW_H);
	
	surface_free(_surf);
}