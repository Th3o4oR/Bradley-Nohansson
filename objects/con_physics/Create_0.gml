/// @desc 

physics_world_create(1/32);
global.phy_gravity = 9.807;
//global.phy_gravity = 5;
physics_world_gravity(0, global.phy_gravity*0.75);

#region //Create room borders (fixtures) (commented out)
//var _fixtures = ds_list_create();

//var _fix = physics_fixture_create();
//physics_fixture_set_edge_shape(_fix, x, y+TILESIZE-1, room_width, y+TILESIZE-1);
//ds_list_add(_fixtures, _fix);

//var _fix = physics_fixture_create();
//physics_fixture_set_edge_shape(_fix, x+TILESIZE, y, x+TILESIZE, room_height);
//ds_list_add(_fixtures, _fix);

//var _fix = physics_fixture_create();
//physics_fixture_set_edge_shape(_fix, room_width-TILESIZE, y, room_width-TILESIZE, room_height);
//ds_list_add(_fixtures, _fix);

//var _fix = physics_fixture_create();
//physics_fixture_set_edge_shape(_fix, x, room_height-TILESIZE, room_width, room_height-TILESIZE);
//ds_list_add(_fixtures, _fix);

//repeat (ds_list_size(_fixtures))
//{
//	var _fix = _fixtures[| 0];
//	physics_fixture_set_density(_fix, 0);
//	physics_fixture_set_friction(_fix, 0.9); //It's friction... come on

//	physics_fixture_bind(_fix, id);
//	physics_fixture_delete(_fix);
//	ds_list_delete(_fixtures, 0);
//}
//ds_list_destroy(_fixtures);
#endregion