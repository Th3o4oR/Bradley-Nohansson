/// @desc screen_shake(magnitude, frames)
/// @arg magnitude	STRENGTH of the shake (radius in pixels)
/// @arg duration	DURATION of the shake in frames (60 = 1 second at 60 fps)

var _magnitude = argument0;
var _duration = argument1;

with (con_camera)
{
	//Warning (for development)
	if (_magnitude > shake_padding) show_message("This much screen shake could potentially show the outside of the room!");
	
	//Apply screenshake
	if (_magnitude > shake_magnitude)
	{
		shake_magnitude_init = _magnitude;
		shake_magnitude = _magnitude;
		shake_duration = _duration;
	}
}