/// @desc 

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
	"Sorry, eh?"
]
index = irandom(array_length_1d(text)-1);
draw_set_font(fnt_pixelzim);
text_w = string_width(text[index]) / 2;
text_h = string_height(text[index]) / 2;
padding = 4;

alpha = 1;
count = room_speed;