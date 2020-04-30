/// @desc new_range
/// @arg val
/// @arg input_low
/// @arg input_high
/// @arg output_low
/// @arg output_high

//Result = ((Input - InputLow) / (InputHigh - InputLow)) * (OutputHigh - OutputLow) + OutputLow;

return ((argument0 - argument1) / (argument2 - argument1)) * (argument4 - argument3) + argument3;