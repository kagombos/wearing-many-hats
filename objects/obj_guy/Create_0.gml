/// @description Start values
// You can write your code in this editor

enum fTypes {
	standing,
	falling,
	slideRight,
	slideLeft
}

hats = array_create(0);
hat_count = 0;
vsp = 0;
hsp = 0;
fall = fTypes.standing;
ignore = 0;