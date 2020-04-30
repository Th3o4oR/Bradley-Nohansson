/// @desc 

//Need a fixture for checking collisions
var _fix = physics_fixture_create();
physics_fixture_set_chain_shape(_fix, false);
//physics_fixture_add_point(_fix, -1, -10);
//physics_fixture_add_point(_fix, -1, -32);
physics_fixture_add_point(_fix, 0, -sprite_height);
physics_fixture_add_point(_fix, 0, -22 * (sprite_height/sprite_get_height(sprite_index)));
physics_fixture_bind(_fix, id);
physics_fixture_delete(_fix);