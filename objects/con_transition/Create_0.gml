/// @desc Setup

enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	QUIT,
	INTRO,
	CUTSCENE,
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;

cutscene_bar_height_init = 0.5;
cutscene_bar_height = cutscene_bar_height_init;