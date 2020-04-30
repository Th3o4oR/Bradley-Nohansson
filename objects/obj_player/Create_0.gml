/// @desc 

//NOTE!!
// Floor always rounds downwards (1.5 --> 1, -1.5 --> -2)
// Ceil is opposite

//Player state
enum STATE
{
	IDLE,
	RUN,
	SLOW,
	AIR
}
player_state = STATE.IDLE;
player_state_previous = player_state; //Keep track of new states
state_new = true;
has_control = true;

//Oops!
oopsed = false;

//Ball!
ball_held = noone; //-4
ball_thrown = false; //If the ball has been thrown, don't pick it up instantly again
ball_offset_x = 1;
ball_offset_y = -8;
ball_charge_min = 0.25;
ball_charge_max = 0.75; //0-1 range (impulse strength)
ball_charge = ball_charge_min;
ball_dir = 0;
initiate_ball_charge = true;
//ball_max_drag_dist = WINDOW_W/2;

//Aim options
enum AIM_OPTION
{
	MIDDLE_DRAG,
	CLICK_DRAG
}
aim_option = AIM_OPTION.CLICK_DRAG;
orig_mx = mouse_x - VIEW_X; //Where mouse originally clicked
orig_my = mouse_y - VIEW_Y;
ball_drag_dist = [VIEW_H/2, VIEW_H*0.2];

//Movement (advanced)
hsp = 0;
hsp_array = [1.5, 2, 2.5];
hsp_accel = [0.05, 0.05, 0.025];
hsp_air_accel = 0.025;
hsp_proxim_buffer = 0.1;
hsp_index = 0;
hsp_decel = [0.25, 0.15, 0.075];
vsp = 0;
grav = global.phy_gravity / 100;
jumpspd = 2.5;
jumped = false;
jump_buffer = 0;
jump_buffer_init = 3; //3 frames after leaving an edge to jump
jump_counterforce = 0.1;