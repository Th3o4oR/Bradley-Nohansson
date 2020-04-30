/// @desc draw_nine_slice_stretch
/// @arg sprite_index
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg alpha

var _sprite = argument0;
var _size = sprite_get_width(argument0)/3;
var _x1 = argument1;
var _y1 = argument2;
var _x2 = argument3;
var _y2 = argument4;
var _a = argument5;
var _w = _x2-_x1;
var _h = _y2-_y1;

draw_sprite_part_ext(_sprite, 0, _size, _size, 1, 1, _x1+_size, _y1+_size, _w-(_size*2), _h-(_size*2), c_white, _a);

draw_sprite_part(_sprite, 0, 0, 0, _size, _size, _x1, _y1); //Top left
draw_sprite_part(_sprite, 0, _size*2, 0, _size, _size, _x1+_w-_size, _y1); //Top right
draw_sprite_part(_sprite, 0, 0, _size*2, _size, _size, _x1, _y1+_h-_size); //Bottom left
draw_sprite_part(_sprite, 0, _size*2, _size*2, _size, _size, _x1+_w-_size, _y1+_h-_size); //Bottom right

//Edges
draw_sprite_part_ext(_sprite, 0, 0, _size, _size, 1, _x1, _y1+_size, 1, _h-(_size*2), c_white, _a); //Left
draw_sprite_part_ext(_sprite, 0, _size*2, _size, _size, 1, _x1+_w-_size, _y1+_size, 1, _h-(_size*2), c_white, _a); //Right
draw_sprite_part_ext(_sprite, 0, _size, 0, 1, _size, _x1+_size, _y1, _w-(_size*2), 1, c_white, _a); //Top
draw_sprite_part_ext(_sprite, 0, _size, _size*2, 1, _size, _x1+_size, _y1+_h-_size, _w-(_size*2), 1, c_white, _a); //Bottom