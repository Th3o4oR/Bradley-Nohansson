/// @desc Pausing

switch (room)
{
	case (rm_init):
	case (rm_menu):
	{
		break;
	}
	
	default:
	{
		instance_create_layer(0, 0, layer, con_pause);
		break;
	}
}