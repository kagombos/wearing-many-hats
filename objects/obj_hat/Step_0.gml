/// @description Gravity
// You can write your code in this editor

if (place_meeting(x, y + vsp + 1, obj_platform)) {
	while (not place_meeting(x, y + sign(vsp), obj_platform) && vsp != 0) {
		y += sign(vsp);
	}
vsp = 0;
falling = 0;
hsp = 0;
}
else {
	vsp = 2;
	if (falling == 0) {
		alarm[0] = 1;
	}
	falling = 1;
}

y += vsp;
x += hsp;


