/// @desc 

var _tutorial_state = global.enable_tutorial;
global.enable_tutorial = true;
if (!instance_exists(con_tutorial)) with (instance_create_layer(0, 0, "Control", con_tutorial))
{
	ds_list_clear(tutorial_text);
	ds_list_add(tutorial_text, "Oops!");
	ds_list_add(tutorial_text, "Careful!");
	ds_list_add(tutorial_text, "You should try to avoid doing that!");
	length = string_length(tutorial_text[| current_line]);
	restart = true;
}
global.enable_tutorial = _tutorial_state;
instance_destroy();