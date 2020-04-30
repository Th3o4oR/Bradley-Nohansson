/// @desc animation_frame_ended
/// @arg goal_frame (For example: image_number for the last frame of the animation, or 1 for the first)
/// @arg image_index
/// @arg image_speed
/// @arg sprite_index

var _goal_frame = argument0;
var _image_index = argument1;
var _image_speed = argument2;
var _sprite_index = argument3;
var _range = _image_speed * sprite_get_speed(_sprite_index) / game_get_speed(gamespeed_fps);
return (_image_index >= _goal_frame - _range) && (_image_index < _goal_frame);