/// @desc Draw black bars

var cam_x = VIEW_X;
var cam_y = VIEW_Y;
var width = VIEW_W;
var height = VIEW_H;

//Draw black bars
if (mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(cam_x, cam_y, cam_x+width, cam_y+((height/2)*percent), false); //Top bar
	draw_rectangle(cam_x, cam_y+height, cam_x+width, cam_y+height-((height/2)*percent), false); //Bottom bar
}