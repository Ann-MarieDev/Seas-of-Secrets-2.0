

//match the state of the paired button object
if instance_exists(buttonObj)
{
	state = buttonObj.state;
}

//closed
if state == 0
{
	mask_index = sprite_index;	
}

//open
if state == 1
{
	mask_index = sNoCollision;
}

//reflect the state change
image_index = state;