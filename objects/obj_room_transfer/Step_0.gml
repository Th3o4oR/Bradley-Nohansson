/// @desc 

if (!instance_exists(obj_player)) exit;

//var _overlap = rect_overlap(x, y, x+sprite_width, y+sprite_height, obj_player.bbox_left, obj_player.bbox_top, obj_player.bbox_right, obj_player.bbox_bottom);
if (place_meeting(x, y, obj_player))
{
	//Kill the player
	with (obj_player)
	{
		var _x = x;
		var _y = y;
		var _layer = layer;
		var _hsp_dir = sign(hsp);
		instance_destroy();
	}
	
	//Dust effect
	repeat (20) with (instance_create_layer(_x, _y, _layer, obj_dust))
	{
		hsp = random_range(0, _hsp_dir);
		vsp = random_range(0, -1);
	}
	
	//Take to next room
	alarm[0] = room_speed;
}