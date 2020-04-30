/// @desc load_json_from_file();
/// @arg filename

//Access arguments
var _filename = argument[0];

//Load buffer
var _buffer = buffer_load(_filename);
var _string = buffer_read(_buffer, buffer_string);
buffer_delete(_buffer);

//Decode buffer
var _json = json_decode(_string);
return _json;