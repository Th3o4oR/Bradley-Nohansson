/// @desc 

if (active) part_emitter_stream(part_syst, part_emit, part, -3);
else part_emitter_stream(part_syst, part_emit, part, 0);

if (!active) switch (room)
{
	case (rm_level_1):
	{
		active = keyboard_check_pressed(ord("W"));
		break;
	}
	case (rm_level_2):
	{
		active = mouse_check_button_released(mb_left);
		break;
	}
	case (rm_level_3):
	{
		active = (global.points > 0);
		break;
	}
}

if (!instance_exists(obj_player)) || (!active) exit;

//var _overlap = rect_overlap(x, y, x+sprite_width, y+sprite_height, obj_player.bbox_left, obj_player.bbox_top, obj_player.bbox_right, obj_player.bbox_bottom);
if (place_meeting(x, y, obj_player))
{
	//Kill the player
	with (obj_player)
	{
		var _x = x;
		var _y = y;
		var _hsp = hsp;
		instance_destroy();
	}
	
	//Dust effect
	repeat (20) with (instance_create_layer(_x, _y, "Dust", obj_dust))
	{
		hsp = random_range(0, _hsp);
		vsp = random_range(0, -1);
	}
	
	//Take to next room
	alarm[0] = room_speed;
}