/// @desc 

if (scored)
{
	var _id = id;
	repeat (30) with (instance_create_layer(phy_com_x, phy_com_y, "Dust", obj_dust))
	{
		hsp = random_range(-_id.phy_speed_x, _id.phy_speed_x);
		vsp = random_range(-_id.phy_speed_y, _id.phy_speed_y);
	}
	instance_destroy();
}