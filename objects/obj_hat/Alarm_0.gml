/// @description Wavy fall
// You can write your code in this editor
var wavy = 2;

if (falling) {
	if (hsp == 0) {
		hsp = wavy * choose(-1, 1);
	}
	else if (hsp > 0) {
		hsp = -wavy;
	}
	else {
		hsp = wavy;
	}
	alarm[0] = room_speed * 0.8;
}