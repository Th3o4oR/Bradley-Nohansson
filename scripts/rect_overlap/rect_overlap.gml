/// @desc rect_overlap
/// @arg l1.x
/// @arg l1.y
/// @arg r1.x
/// @arg r1.y
/// @arg l2.x
/// @arg l2.y
/// @arg r2.x
/// @arg r2.y

//Checks if two rectangles (l1, r1) and (l2, r2) overlap

if (argument0 >= argument6) || (argument4 >= argument2) return false;
if (argument1 >= argument7) || (argument5 >= argument3) return false;
return true;