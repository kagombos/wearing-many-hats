/// @description Spawn starting hats
// You can write your code in this editor

if (room = rm_game) {
	repeat(3) {
		instance_create_layer(irandom_range(100, room_width - 100), 100, "Instances", obj_hat);
		spawn_hat();
	}
	
	alarm[0] = 2 * room_speed;
}