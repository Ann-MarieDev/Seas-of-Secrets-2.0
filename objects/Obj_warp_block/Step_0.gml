/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, oPlayer) && !instance_exists(Obj_transition)
	{
	var inst = instance_create_depth(0,0, -9999, Obj_transition);
	inst.target_x = target_x;
	inst.target_y = target_y;
	inst.target_rm = target_rm;
	}


