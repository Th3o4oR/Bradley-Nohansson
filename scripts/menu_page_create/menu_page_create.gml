/// @description menu_page_create
/// @arg ["name1",type1,entries1...]
/// @arg ["name2",type2,entries2...]

/*
	ds_menu_audio = create_menu_page
	(
		["MASTER",	MENU_TYPE.SLIDER,			change_volume,			0.5,	[0, 1]],
		["MUSIC",	MENU_TYPE.SLIDER,			change_volume,			0.3,	[0, 1]],
		["BACK",	MENU_TYPE.PAGE_TRANSFER,	MENU_PAGE.SETTINGS]
	);
	
	_ds_grid_id[# 1, 3] == 0.3
*/

//Makes each "element" (in example above, one of the three main arrays) an argument
var _arg;
for (var _i = 0; _i < argument_count; _i ++) _arg[_i] = argument[_i];

//Change the "5" to increase the number of "attributes" (elements in the array) a menu page can have
var _ds_grid_id = ds_grid_create(5, argument_count);

//Loop through the "columns" of the grid
for (var _y = 0; _y < argument_count; _y ++)
{
	//Loop through the "rows" of the grid, and add to it the value from the array
	var _array = _arg[_y];
	for (var _x = 0; _x < array_length_1d(_array); _x ++) _ds_grid_id[# _x, _y] = _array[_x];
}

return _ds_grid_id;