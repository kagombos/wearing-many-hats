/// @description Spawn starting hats
// You can write your code in this editor

if (room = rm_game) {
	repeat(3) {
		spawn_hat();
	}
	
	alarm[0] = 2 * room_speed;
}