/// @description Stand on platform
// You can write your code in this editor

var const_run_speed = 0.3;
var run_speed = 0.3;
var max_speed = 0.8;
var jump_height = -10;

if (keyboard_check(vk_up) && fall == 0){
	vsp = jump_height;	
}

if (keyboard_check_pressed(vk_up)) {
	if (fall == 2) {
		vsp = jump_height / 1.4;
		hsp = jump_height / 1.4;
		alarm[0] = 6;
		ignore = 1;
	}
	else if (fall == 3) {
		vsp = jump_height / 1.4;
		hsp = -jump_height / 1.4;
		alarm[0] = 6;
		ignore = 1;
	}
}

if (not ignore && !fall) {
	if (keyboard_check(vk_left)) {
		hsp -= run_speed;
	}
	else if (keyboard_check(vk_right)) {
		hsp += run_speed;
	}
}
else if (not ignore) {
	if (keyboard_check(vk_left)) {
		hsp -= run_speed / 2;
	}
	else if (keyboard_check(vk_right)) {
		hsp += run_speed / 2;
	}
}

if (!keyboard_check(vk_left) && hsp < 0 && !ignore) {
	hsp = hsp / 1.2;
	if (hsp + run_speed * 2 > 0) {
		hsp = 0;
	}
}
else if (!keyboard_check(vk_right) && hsp > 0 && !ignore) {
	hsp = hsp / 1.2;
	if (hsp -+ run_speed * 2 < 0) {
		hsp = 0;
	}
}

if (fall == fTypes.falling) {
	if (vsp < 12) {
		vsp += 0.3; //whatever here is the power of gravity
	}
	else {
		vsp = 12;
	}
}
else if (fall >= 2 && !ignore) {
	vsp = 1;
}

if (hsp > max_speed || hsp < -max_speed) {
	run_speed = run_speed / 8;
}
else {
	run_speed = const_run_speed;
}

if (hsp > 4 * max_speed || hsp < -4 * max_speed) {
	run_speed = 0;
}

if (place_meeting(x, y + vsp, obj_platform)) {
	while (not place_meeting(x, y + sign(vsp), obj_platform) && vsp != 0) {
		y += sign(vsp);
	}
	vsp = 0;
}
else if (place_meeting(x + hsp, y, obj_platform)) {
	while (not place_meeting(x + sign(hsp), y, obj_platform) && hsp != 0) {
		x += sign(hsp);
	}
	if (!ignore) {
		hsp = 0;
	}
}

if (!place_meeting(x, y, obj_platform) && place_meeting(x, y - 1, obj_platform)) {
	y += 1;
}

x += hsp;
y += vsp;


