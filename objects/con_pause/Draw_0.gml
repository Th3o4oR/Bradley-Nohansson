/// @desc 

shader_set(shd_grayscale);

var _pos = application_get_position();
draw_surface_stretched(pause_surf, _pos[0], _pos[1], _pos[2]-_pos[0], _pos[3]-_pos[1]);

shader_reset();