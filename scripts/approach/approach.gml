/// @desc approach(a, b, amount)
/// @arg start
/// @arg end
/// @arg amount

// Moves "a" towards "b" by "amount" and returns the result
// Nice because it will not overshoot "b", and works in both directions
// Examples:
//      speed = approach(speed, max_speed, acceleration);
//      hp = approach(hp, 0, damage_amount);
//      hp = approach(hp, max_hp, heal_amount);
//      x = approach(x, target_x, move_speed);
//      y = approach(y, target_y, move_speed);

var _current = argument[0];
var _target = argument[1];
var _amount = argument[2];

if (_current < _target) return min(_current+_amount, _target);
else return max(_current-_amount, _target);