/// @desc 

sprite_index = -1;

text = [
	"Oops!",
	"Oh no!",
	"I'm just going to leave this here.",
	"Why is this so slippery?",
	"I've got it next time!",
	"Don't worry! It won't escape again.",
	"Whoops!",
	"Uh-oh.",
	"Oh dear.",
	"F@*#!",
	"Sorry, eh?",
	"Why is this so big?"
]
index = irandom(array_length_1d(text)-1);
draw_set_font(fnt_pixelzim);
text_w = string_width(text[index]) / 2;
text_h = string_height(text[index]) / 2;
//show_message(text_w);
padding = 4;

//x = clamp(x, text_w, room_width-text_w);
//y = clamp(y, text_h, room_height-text_h);

alpha = 1;
count = room_speed;