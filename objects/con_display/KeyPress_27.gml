/// @desc Pausing

switch (room)
{
	case (rm_level_1):
	case (rm_level_2):
	case (rm_level_3):
	case (rm_level_4):
	{
		instance_create_layer(0, 0, layer, con_pause);
		break;
	}
}