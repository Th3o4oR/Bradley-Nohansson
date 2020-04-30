//Macros

#region //Camera / GUI / Display / Window commands
#macro VIEW view_camera[0]
#macro VIEW_X camera_get_view_x(VIEW)
#macro VIEW_Y camera_get_view_y(VIEW)
#macro VIEW_W camera_get_view_width(VIEW)
#macro VIEW_H camera_get_view_height(VIEW)
#macro GUI_W display_get_gui_width()
#macro GUI_H display_get_gui_height()
#macro WINDOW_W window_get_width()
#macro WINDOW_H window_get_height()
#macro DISPLAY_W display_get_width()
#macro DISPLAY_H display_get_height()

//Camera / View ideal properties (set one to 0 to be dynamically fit to the monitor)
#macro FULLSCREEN true
#macro TRUE_RES true
#macro IDEAL_VIEW_W 0
#macro IDEAL_VIEW_H 128 //320x200 on a 16:10 (8:5) monitor

//Some macro commands for dealing with window resizing
#macro CENTER_WINDOW con_display.alarm[0] = 1

//Visuals
#macro TILESIZE 8

#macro SAVEFILE "Nohansson.sav"

//Debugging
#macro VISUAL_DEBUG false
#macro PHYSICS_DEBUG false
#macro PHSYICS_DEBUG_FLAG phy_debug_render_obb | phy_debug_render_core_shapes | phy_debug_render_shapes
#endregion