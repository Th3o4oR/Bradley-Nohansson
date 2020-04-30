/// @desc 

draw_self();

#region //Draw arrow pointing in the direction the ball will be shot
if (instance_exists(obj_player)) && (obj_player.ball_charge > obj_player.ball_charge_min) && (!phy_active) && (mouse_check_button(mb_left))
{
	//All of this to get the position on edge of ellipse
	var _dir = 0;
	if (instance_exists(obj_player)) _dir = -obj_player.ball_dir;
	
	var _a = sprite_width/2, _b = sprite_height/2, _rot = phy_rotation + _dir;
	var _r = (_a*_b) / sqrt(power(_b*dcos(_rot), 2) + power(_a*dsin(_rot), 2)); //Distance to edge of ellipse at given angle
	var _x = phy_position_x + lengthdir_x(_r, _dir);
	var _y = phy_position_y + lengthdir_y(_r, _dir);
	
	var _dis = obj_player.ball_charge;
	var _xdis = lengthdir_x(_dis * display_max, _dir);
	var _ydis = lengthdir_y(_dis * display_max, _dir);
	
	draw_arrow(_x, _y, _x+_xdis, _y+_ydis, 2);
	
	//Draw ellipse around ball
	//var _i = 0; repeat (360)
	//{
	//	var _a = 8, _b = 5, _rot = phy_rotation + _i;
	//	var _r = (_a*_b) / sqrt(power(_b*dcos(_rot), 2) + power(_a*dsin(_rot), 2));
		
	//	var _x = phy_position_x + lengthdir_x(_r, _i);
	//	var _y = phy_position_y + lengthdir_y(_r, _i);
	//	draw_point(_x, _y);
	//	_i ++;
	//}
}
#endregion

#region //If outside view, draw pointer towards ball
//Point to ball
if (!point_in_rectangle(phy_position_x, phy_position_y, VIEW_X, VIEW_Y, VIEW_X+VIEW_W, VIEW_Y+VIEW_H))
{
	var _sx = VIEW_X + VIEW_W/2; //Source x
	var _sy = VIEW_Y + VIEW_H/2; //Source y
	var _tx = phy_position_x;
	var _ty = phy_position_y;
	var _pad = 4;
	var _x = _sx + clamp(_tx-_sx, -VIEW_W/2+_pad, VIEW_W/2-_pad);
	var _y = _sy + clamp(_ty-_sy, -VIEW_H/2+_pad, VIEW_H/2-_pad);
	var _dir = point_direction(_x, _y, _tx, _ty);
	draw_sprite_ext(spr_pointer, 0, _x, _y, 1, 1, _dir, c_white, 1);
}
#endregion

//draw_circle_color(x, y, 2, c_red, c_red, false);
//draw_circle_color(phy_position_x, phy_position_y, 2, c_navy, c_navy, false);