///// @desc

//enum HACK_EVENTS //Which events to activate the hack in
//{
//	INSTANT,
//	STEP,
//	POST_DRAW,
	
//	SIZE
//}

//enum HACKS
//{
//	RESOLUTION,
//	WINDOW_SIZE,
//	CAMERA_SPEED,
//	GRAYSCALE,
//	RAINBOW,
//	COLOR_BLIND,
//	RADIAL_BLUR,
//	GAUSSIAN_BLUR,
//	SEPIA,
//	INVERT_COLOURS,
//	GRAVITY,
//	SUDDEN_GRAVITY,
	
//	SIZE
//}
//hack_info = ds_grid_create(4, 1); //All of the hacks are here (they're added to the grid in the "hack_create" script)
//active_hacks = ds_list_create();
//main_surface = -1;
//temp_surface = -1;
//auto_draw_app_surf = true;

////Screen
//create_hack("Resolution",		HACK_EVENTS.INSTANT,	hack_resolution);
//create_hack("Window size",		HACK_EVENTS.INSTANT,	hack_window_size);
//create_hack("Camera speed",		HACK_EVENTS.INSTANT,	hack_camera_speed);
//create_hack("Grayscale",		HACK_EVENTS.POST_DRAW,	hack_shader,		shd_grayscale);
//create_hack("Rainbow",			HACK_EVENTS.POST_DRAW,	hack_rainbow);
//create_hack("Color-blindness",	HACK_EVENTS.POST_DRAW,	hack_shader,		shd_red_green);
//create_hack("Radial blur",		HACK_EVENTS.POST_DRAW,	hack_radial_blur);
//create_hack("Gaussian blur",	HACK_EVENTS.POST_DRAW,	hack_gaussian_blur);
//create_hack("Sepia",			HACK_EVENTS.POST_DRAW,	hack_shader,		shd_sepia);
//create_hack("Invert colours",	HACK_EVENTS.POST_DRAW,	hack_shader,		shd_color_invert);
//create_hack("Reduce gravity",	HACK_EVENTS.INSTANT,	hack_gravity);
//create_hack("Sudden gravity",	HACK_EVENTS.INSTANT,	hack_sudden_gravity);