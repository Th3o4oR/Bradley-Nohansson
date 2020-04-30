/// @desc 

count = max(count-1, 0);
if (count == 0)
{
	alpha = min(alpha-0.05, lerp(alpha, 0, 0.1));
	if (alpha <= 0) instance_destroy();
}

//alpha -= 0.01;
//if (alpha <= 0) instance_destroy();