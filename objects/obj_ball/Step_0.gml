/// @desc 

//Scoring
if (!scored) && (phy_active) && (physics_test_overlap(phy_position_x, phy_position_y, phy_rotation, obj_posts))
{
	scored = true;
	//global.points ++;
	//global.timer_scale *= 1.5;
}
//else if (!physics_test_overlap(phy_position_x, phy_position_y, phy_rotation, obj_posts)) scored = false;