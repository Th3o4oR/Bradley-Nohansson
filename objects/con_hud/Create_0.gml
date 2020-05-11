/// @desc Score, crosshair, etc

//Shader
outline_uniform_px_w = shader_get_uniform(shd_outline, "pixelWidth");
outline_uniform_px_h = shader_get_uniform(shd_outline, "pixelHeight");

#region //"Crosshair"
crosshair_sprite = spr_crosshair_temp;
crosshair_image_index = 0;
crosshair_image_speed = 1;
crosshair_image_scale = 1;
crosshair_anim_loop = false;
crosshair_pos_x = mouse_x;
crosshair_pos_y = mouse_y;
crosshair_aim_assist = true; //Wether to draw a circle around the crosshair when aiming
crosshair_follow_spd = 0.25;
//crosshair_anim_timer_init = room_speed*4;
//crosshair_anim_timer = irandom_range(crosshair_anim_timer_init, 2*crosshair_anim_timer_init);
crosshair_tex_w = texture_get_texel_width(sprite_get_texture(spr_crosshair_temp, 0));
crosshair_tex_h = texture_get_texel_height(sprite_get_texture(spr_crosshair_temp, 0));
#endregion

#region //Timer
//global.room_start_points = 0;
global.pause_timer = true;
global.timer = 0;
global.timer_seconds = 0;
global.timer_scale = 1;
timer_text = "";
var _load = load_from_file(SAVEFILE, "Score", "Highscore");
previous_highscore = (_load != undefined) ? _load : 0;
var _texture_ptr = sprite_get_texture(fnt_pixelzim, 0); // Find pointer to our texture
font_tex_w = texture_get_texel_width(_texture_ptr); //Texel width
font_tex_h = texture_get_texel_height(_texture_ptr); //Texel height
#endregion