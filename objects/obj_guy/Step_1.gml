/// @description Check for fall state
// You can write your code in this editor

if (place_meeting(x, y + vsp + 1, obj_platform) || place_meeting(x, y + vsp - 1, obj_platform)) {
	fall = 0;
}
else if (place_meeting(x + hsp + 1, y, obj_platform)) {
	fall = 2;
}
else if (place_meeting(x + hsp - 1, y, obj_platform)) {
	fall = 3;
}
else {
	fall = 1;
}