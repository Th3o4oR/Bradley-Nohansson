/// @desc 

//Destroy datastructures
for (var _i = 0; _i < array_length_1d(menu_pages); _i ++)
{
	ds_grid_destroy(menu_pages[_i]);
}

surface_free(pause_surf);
surface_free(text_surf);