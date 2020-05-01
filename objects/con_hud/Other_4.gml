/// @desc Update highscore

if (room == rm_level_end)
{
	global.pause_timer = true;
	var _load = load_from_file(SAVEFILE, "Score", "Highscore");
	var _time = global.timer_seconds + global.timer/1000000;
	previous_highscore = (_load != undefined) ? _load : _time;
	if (previous_highscore > _time) || (_load == undefined) save_to_file(SAVEFILE, "Score", "Highscore", _time);
	if (_load == undefined) previous_highscore = "N/A";
	else
	{
		var _decimal = frac(previous_highscore) * 1000000;
		previous_highscore = string(floor(previous_highscore)) + ":" + string_copy(string(_decimal), 1, 2);
	}
}