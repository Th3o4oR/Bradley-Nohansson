/// @desc 

display_max = 16; //How long the arrow displaying your charge should be
scored = false;

var _top_coords = [
	[-8, -1],
	[-7, -3],
	[-6, -4],
	[-3, -5],
	[3, -5],
	[6, -4],
	[7, -3],
	[8, -1]
];
ball_fix_top = fixture_create(id, 0, _top_coords, 0.35, 0.6, 0.7, 0.1, 0.5, true);
var _bot_coords = [
	[8, 1],
	[7, 3],
	[6, 4],
	[3, 5],
	[-3, 5],
	[-6, 4],
	[-7, 3],
	[-8, 1],
];
ball_fix_bot = fixture_create(id, 0, _bot_coords, 0.35, 0.6, 0.7, 0.1, 0.5, true);
var _rect_coords = [
	[8, 2],
	[-8, 2],
	[-8, -2],
	[8, -2],
];
ball_fix_rect = fixture_create(id, 0, _rect_coords, 0.35, 0.6, 0.7, 0.1, 0.5, true);
//physics_mass_properties(0.06, 0, 0, phy_inertia);

//#region //Fixtures
//var _fixtures = ds_list_create();

//image_xscale = 0.5;
//image_yscale = 0.5;

//var _xs = image_xscale;
//var _ys = image_yscale;
//ds_list_add(_fixtures, fixture_create(-8*_xs,-1*_ys, -7*_xs,-3*_ys, -6*_xs,-4*_ys, -3*_xs,-5*_ys, 3*_xs,-5*_ys, 6*_xs,-4*_ys, 7*_xs,-3*_ys, 8*_xs,-1*_ys));
//ds_list_add(_fixtures, fixture_create(8*_xs,1*_ys, 7*_xs,3*_ys, 6*_xs,4*_ys, 3*_xs,5*_ys, -3*_xs,5*_ys, -6*_xs,4*_ys, -7*_xs,3*_ys, -8*_xs,1*_ys));

//ds_list_add(_fixtures, _fix);

//repeat (ds_list_size(_fixtures))
//{
//	var _fix = _fixtures[| 0];
//	physics_fixture_set_density(_fix, 0.35);
//	physics_fixture_set_restitution(_fix, 0.7); //Recovered momentum after a bounce
//	physics_fixture_set_linear_damping(_fix, 0.1); //Friction when NOT touching anything (air)
//	physics_fixture_set_angular_damping(_fix, 0.5); //Friction when NOT touching anything (air)
//	physics_fixture_set_friction(_fix, 0.6); //It's friction... come on

//	physics_fixture_bind(_fix, id);
//	physics_fixture_delete(_fix);
//	ds_list_delete(_fixtures, 0);
//}
//ds_list_destroy(_fixtures);
//physics_mass_properties(0.06, 0, 0, phy_inertia);
//#endregion