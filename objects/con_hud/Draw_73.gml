///// @desc 

//Drawing properties
draw_set_colour(c_white);
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_set_font(fnt_pixelzim);

//Set our shader instead of default one
shader_set(shd_outline);

//Draw crosshair (SCALE!)
if (instance_exists(obj_player))
{
	shader_set_uniform_f(outline_uniform_px_w, crosshair_tex_w);
	shader_set_uniform_f(outline_uniform_px_h, crosshair_tex_h);
	var _col = merge_color(c_white, c_red, new_range(obj_player.ball_charge, obj_player.ball_charge_min, obj_player.ball_charge_max, 0, 1));
	draw_sprite_ext(crosshair_sprite, floor(crosshair_image_index), crosshair_pos_x, crosshair_pos_y, crosshair_image_scale, crosshair_image_scale, 0, _col, 1);
	
	//Draw circle to show drag range
	if (crosshair_aim_assist) draw_circle_color(crosshair_pos_x, crosshair_pos_y, obj_player.ball_drag_dist[obj_player.aim_option], _col,_col, true);
}

if (instance_exists(obj_posts)) || (global.points > 0)
{
	//Draw score with shader
	shader_set_uniform_f(outline_uniform_px_w, font_tex_w);
	shader_set_uniform_f(outline_uniform_px_h, font_tex_h);
	draw_text_ext_transformed(VIEW_X+VIEW_W/2, VIEW_Y+4, string(global.points), -1, GUI_W, global.point_scale, global.point_scale, 0);
}

//Set shader to default
shader_reset();