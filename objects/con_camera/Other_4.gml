/// @desc 

view_enabled = true;
view_visible[0] = true;

var _w = con_display.ideal_width;
var _h = con_display.ideal_height;
camera_set_view_size(VIEW, _w, _h);
//surface_resize(application_surface, _w*con_display.window_scale, _h*con_display.window_scale);