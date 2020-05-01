/// @desc 

var _coords = [
	[0, 0],
	[sprite_width, 0],
	[sprite_width, sprite_height],
	[0, sprite_height]
];
fixture = fixture_create(id, 0, _coords, 0, 0.9, 0, 0, 0, true);

active = false;

//Particles!
part = part_type_create();
part_type_color2(part, c_navy, c_white); //Blue --> white
part_type_gravity(part, 0.005, 90); //Up
part_type_life(part, room_speed, room_speed*2);
part_type_alpha2(part, 1, 0);
part_type_size(part, 1, 1, -1/240, 0);
part_type_shape(part, pt_shape_pixel);

part_syst = part_system_create();
part_emit = part_emitter_create(part_syst);
part_emitter_region(part_syst, part_emit, x+2, x+sprite_width-1, y, y, ps_shape_rectangle, ps_distr_linear);