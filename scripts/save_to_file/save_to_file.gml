/// @desc save_to_file();
/// @arg filename	Name of file to save to
/// @arg sub-map	Key of "sub-compartment" (a map inside the main map) to store save in
/// @arg key		Key to store the value with
/// @arg value		Value to save

//Access arguments
var _filename = argument[0];
var _sub_map_key = argument[1];
var _key = argument[2];
var _value = argument[3];

//Access json (save_map)
if (file_exists(_filename)) var _save_map = load_json_from_file(_filename);
else var _save_map = ds_map_create();

//Access "sub_map"
if (ds_map_exists(_save_map, _sub_map_key)) var _sub_map = _save_map[? _sub_map_key];
else
{
	//Create the "sub-map"
	var _sub_map = ds_map_create();
	ds_map_add_map(_save_map, _sub_map_key, _sub_map);
}

//Add value (or change it if it already existed)
_sub_map[? _key] = _value;

//Save to file
var _json = json_encode(_save_map);
save_json_to_file(_filename, _json);

//Clean up
ds_map_destroy(_save_map);