/// @desc physics_ficture_create_polygon
/// @arg id
/// @arg collision_group
/// @arg coordinates_array
/// @arg *density
/// @arg *friction
/// @arg *restitution
/// @arg *linear_damping
/// @arg *angular_damping
/// @arg *awake

//Creates a polygon fixture, and adds points where you specify

var _fix = physics_fixture_create();
physics_fixture_set_polygon_shape(_fix);
var _array = argument[2];

for (var _i = 0; _i < array_length_1d(_array); _i++)
{
	var _point = _array[_i];
	physics_fixture_add_point(_fix, _point[0], _point[1]);
}

physics_fixture_set_density(_fix, argument[3]);
physics_fixture_set_friction(_fix, argument[4]);
physics_fixture_set_restitution(_fix, argument[5]);
physics_fixture_set_linear_damping(_fix, argument[6]);
physics_fixture_set_angular_damping(_fix, argument[7]);

var _fix_return = physics_fixture_bind(_fix, argument[0]);
physics_fixture_delete(_fix);
phy_active = argument[8];

return (_fix_return);

////Error handling
//if (argument_count & 1) show_error("Argument count invalid. Must be an even number", true); //Uneven argument count
//if (argument_count > 16) show_error("Too many fixture points! Only 8 points allowed", true);

////Create fixture
//var _fix = physics_fixture_create();
//physics_fixture_set_polygon_shape(_fix);
//var _i = 0; repeat (argument_count/2)
//{
//	physics_fixture_add_point(_fix, argument[_i], argument[_i+1]);
//	_i += 2;
//}

//return (_fix);