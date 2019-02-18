/// @description Stand on platform
// You can write your code in this editor

// some important numbers
var const_run_speed = 0.3;
var run_speed = 0.3 * power(0.95, hat_count);
var max_speed = 0.8 * power(0.95, hat_count);
var jump_height = -10;


// jumping
if (keyboard_check(vk_up) && fall == 0){
	vsp = jump_height;	
}

// wall jumping
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

// moving
if (not ignore && !fall) {
	if (keyboard_check(vk_left)) {
		hsp -= run_speed;
	}
	else if (keyboard_check(vk_right)) {
		hsp += run_speed;
	}
}
// moving while falling
else if (not ignore) {
	if (keyboard_check(vk_left)) {
		hsp -= run_speed / 2;
	}
	else if (keyboard_check(vk_right)) {
		hsp += run_speed / 2;
	}
}

// slowing down
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

// falling
if (fall == fTypes.falling) {
	if (vsp < 12) {
		vsp += 0.3; //whatever here is the power of gravity
	}
	else {
		vsp = 12;
	}
}
// wall sliding
else if (fall >= 2 && !ignore) {
	vsp = 1;
}

if (hsp > max_speed || hsp < -max_speed) {
	run_speed = run_speed / 8;
}
else {
	run_speed = const_run_speed;
}

// capping at high speeds
if (hsp > 4 * max_speed || hsp < -4 * max_speed) {
	run_speed = 0;
}

// vertical platform collision
if (place_meeting(x, y + vsp, obj_platform)) {
	while (not place_meeting(x, y + sign(vsp), obj_platform) && vsp != 0) {
		y += sign(vsp);
	}
	vsp = 0;
}
// horizontal platform collision
else if (place_meeting(x + hsp, y, obj_platform)) {
	while (not place_meeting(x + sign(hsp), y, obj_platform) && hsp != 0) {
		x += sign(hsp);
	}
	if (!ignore) {
		hsp = 0;
	}
}

// fix so you dont stick to ceilings
if (!place_meeting(x, y, obj_platform) && place_meeting(x, y - 1, obj_platform)) {
	y += 1;
}

// adding speed to position
x += hsp;
y += vsp;

// putting on hats
var inst = instance_place(x, y, obj_hat);
if (inst != noone) {
	put_on_hat(self, inst);
}

// hat positions
for (var i = 0; i < hat_count; i++) {
	if (hats[i]) {
		if (hats[i].x > x + 10 * i) {
			hats[i].x = x + 10 * i;
		}
		else if (hats[i].x < x - 10 * i) {
			hats[i].x = x - 10 * i;
		}
		hats[i].y = y - (obj_wornhat.bbox_bottom - obj_wornhat.bbox_top) * i - obj_guy.sprite_height / 2;
	}
}