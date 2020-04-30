/// @desc load_from_file();
/// @arg filename	Name of file to save to
/// @arg sub-map	Key of "sub-compartment" (a map inside the main map) to load from
/// @arg key		Key to load the value from

//Access arguments
var _filename = argument[0];
var _sub_map_key = argument[1];
var _key = argument[2];

//Check if file exists
var _save_map = undefined;
if (file_exists(_filename))
{
	//Open file, turn data into a ds_map
	_save_map = load_json_from_file(_filename);
	
	//Check if "sub-folder" exists
	if (ds_map_exists(_save_map, _sub_map_key))
	{
		//Access "sub-folder"
		var _sub_map = _save_map[? _sub_map_key];
		
		//Check if value exists
		if (ds_map_exists(_sub_map, _key))
		{
			//Get value
			var _value = _sub_map[? _key];
			
			//Destroy map and return value
			ds_map_destroy(_save_map);
			return (_value);
		}
	}
}

//Value, "sub_map" or file doesn't exist, so we clean up and return undefined
if (_save_map != undefined) && (ds_exists(_save_map, ds_type_map)) ds_map_destroy(_save_map);
return undefined;