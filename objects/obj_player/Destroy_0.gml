/// @desc 

if (ball_held != noone)
{
	with (ball_held)
	{
		phy_active = true;
		physics_apply_force(phy_com_x, phy_com_y, other.hsp*10, other.vsp);
	}
}