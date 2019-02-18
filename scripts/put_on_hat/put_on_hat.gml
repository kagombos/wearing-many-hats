var guy = argument0;
var hat = argument1;
var hat_stack = guy.hats;

if (guy.hat_count) {
	var wornhat = instance_create_layer(
		guy.hats[guy.hat_count - 1].x, 
		guy.hats[guy.hat_count - 1].y + obj_wornhat.bbox_bottom - obj_wornhat.bbox_top, 
		"Instances", 
		obj_wornhat
	);
}
else {
	var wornhat = instance_create_layer(
		guy.x, 
		guy.y - obj_guy.sprite_height / 2, 
		"Instances", 
		obj_wornhat
	);
}
wornhat.image_blend = hat.image_blend;
wornhat.wearer = guy;
guy.hats[guy.hat_count] = wornhat;
guy.hat_count++;
instance_destroy(hat, false);