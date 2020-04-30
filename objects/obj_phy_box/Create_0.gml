/// @desc 
//log(bbox_left, bbox_top, bbox_right, bbox_bottom);

var _fix = physics_fixture_create();
physics_fixture_set_box_shape(_fix, sprite_width/2, sprite_height/2);
physics_fixture_set_density(_fix, 0);
physics_fixture_set_friction(_fix, 0.9);
physics_fixture_bind_ext(_fix, id, -sprite_width/2, -sprite_height/2);
physics_fixture_delete(_fix);

//log(bbox_left, bbox_top, bbox_right, bbox_bottom);

//log(x, y, phy_position_x, phy_position_y);