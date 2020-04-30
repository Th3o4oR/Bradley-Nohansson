/// @desc 

var _fix = physics_fixture_create();
physics_fixture_set_polygon_shape(_fix);
physics_fixture_add_point(_fix, 0, 0);
physics_fixture_add_point(_fix, sprite_width, sprite_height);
physics_fixture_add_point(_fix, 0, sprite_height);
//physics_fixture_set_box_shape(_fix, sprite_width/2, sprite_height/2);
physics_fixture_set_density(_fix, 0);
physics_fixture_set_friction(_fix, 0.9);
physics_fixture_bind(_fix, id);
physics_fixture_delete(_fix);