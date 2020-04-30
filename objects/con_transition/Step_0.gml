/// @desc Progress transition

if (mode != TRANS_MODE.OFF)
{
	//Open bars
	if (mode == TRANS_MODE.INTRO) percent = max(0, percent-max((percent/10), 0.005));
	//Close bars
	else if (mode == TRANS_MODE.CUTSCENE)
	{
		if (percent > cutscene_bar_height) percent = max(cutscene_bar_height, percent-max((percent/10), 0.005));
		else percent = min(cutscene_bar_height, percent+max(((1-percent)/10), 0.005));
	}
	else percent = min(1, percent+max(((1-percent)/10), 0.005));
	
	//Switch statement for what modes are selected
	if (percent == 1) || (percent == 0)
	{
		switch (mode)
		{
			//Close black bars
			case TRANS_MODE.INTRO: mode = TRANS_MODE.OFF; break;
			
			//Go to the next room
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			
			//Go to a target room
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
			
			//Restart game
			case (TRANS_MODE.RESTART): game_restart(); break;
			
			//Exit game
			case (TRANS_MODE.QUIT): game_end(); break;
		}
	}
}

//Make sure game is always at 60 fps when a transition happens
if (percent != 0) && (room_speed != 60) game_set_speed(60, gamespeed_fps);