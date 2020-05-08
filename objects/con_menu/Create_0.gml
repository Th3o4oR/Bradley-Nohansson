/// @desc 

//ukey = ["W", vk_up];
//dkey = ["S", vk_down];
//lkey = ["A", vk_left];
//rkey = ["D", vk_right];

con_transition.cutscene_bar_height = 0.35;
slide_transition(TRANS_MODE.CUTSCENE);

enum MENU_PAGE
{
	MAIN,
	SETTINGS, //Has subpages
		AUDIO,
		GRAPHICS,
		ERASE,
	QUIT,
}

enum MENU_ACTION {
	RUN_SCRIPT,
	PAGE_TRANSFER,
	SLIDER,
	SHIFT,
	TOGGLE,
}

menu_page_main = menu_page_create(
	["PLAY",		MENU_ACTION.RUN_SCRIPT,		"Play"],
	["SETTINGS",	MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.SETTINGS],
	["QUIT",		MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.QUIT]
);
menu_page_settings = menu_page_create(
	["AUDIO",		MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.AUDIO],
	["GRAPHICS",	MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.GRAPHICS],
	["ERASE DATA",	MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.ERASE],
	["RETURN",		MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.MAIN]
);
var _load = load_from_file(SAVEFILE, SAVE_SETTING, "Master volume")
var _master_volume = (_load != undefined) ? _load : 0.5;
menu_perform_action("Master volume", _master_volume);
menu_page_audio = menu_page_create(
	["MASTER",		MENU_ACTION.SLIDER,			"Master volume",	_master_volume,	[0, 1]],
	["RETURN",		MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.SETTINGS]
);
menu_page_graphics = menu_page_create(
	["FULLSCREEN",	MENU_ACTION.TOGGLE,			"Fullscreen",		global.fullscreen,		["WINDOWED", "FULLSCREEN"]],
	["RESOLUTION",	MENU_ACTION.SHIFT,			"Resolution",		global.current_res,		global.resolutions],
	["RETURN",		MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.SETTINGS]
);
menu_page_erase = menu_page_create(
	["CONFIRM",		MENU_ACTION.RUN_SCRIPT,		"Erase"],
	["CANCEL",		MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.SETTINGS]
);
menu_page_quit = menu_page_create(
	["CONFIRM",		MENU_ACTION.RUN_SCRIPT,		"Quit"],
	["CANCEL",		MENU_ACTION.PAGE_TRANSFER,	MENU_PAGE.MAIN]
);

//The array below has to correspond to the order of the enumerator of menu pages
menu_pages = [menu_page_main, menu_page_settings, menu_page_audio, menu_page_graphics, menu_page_erase, menu_page_quit];
page = 0;
inputting = false; //True when the user is changing a setting
activated = false;
prev_value = 0;
for (var _i = 0; _i < array_length_1d(menu_pages); _i ++) menu_option[_i] = 0; //Which option is selected on the different menu pages, this way the game "remembers" which element you had selected on the previous page when navigating the menu

//Options
slider_len = 32;

//Offset
draw_set_font(fnt_pixelzim);
yoffset = string_height("W"); //Distance between menu elements