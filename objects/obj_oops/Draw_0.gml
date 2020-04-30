/// @desc 

draw_set_alpha(alpha);
draw_nine_slice_stretch(spr_bubble_nineslice, x-text_w/2-padding, y-text_h/2-padding, x+text_w/2+padding, y+text_h/2+padding, alpha);
draw_set_alpha(1);

draw_set_font(fnt_pixelzim);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed_colour(x, y, text[index], 0.5, 0.5, 0, c_black, c_black, c_black, c_black, alpha);