//getting the inputs
rightKey = keyboard_check(vk_right);
upKey = keyboard_check(vk_up);
leftKey = keyboard_check(vk_left);
downKey = keyboard_check(vk_down);
sprintKey = keyboard_check(vk_shift);
interactKeyPressed = keyboard_check_pressed(vk_space);


if keyboard_check_pressed(vk_f4) { window_set_fullscreen(!window_get_fullscreen()); };

// Sprint modifier
if sprintKey {
    moveSpd = 2; // Increase movement speed while sprinting
} else {
    moveSpd = 1; // Reset movement speed to default
}

// Rest of your code remains unchanged


//get info for each state
#region
	//movement state (full player control)
	if state == movementState 
	{
		//set the qualities of the state
			movementControl = true;	
			autoSpriteControl = true;
			animate = true;
			
		//state swapping
			if place_meeting(x, y, oIceGround) && (xspd != 0 || yspd != 0)
			{
				state = slidingState;
			}
	}
	
	//sliding state
	if state == slidingState
	{
		//set the qualities of the state
			movementControl = false;
			autoSpriteControl = false;
			animate = false;
		
		//state swapping
			if !place_meeting(x, y, oIceGround) || (xspd == 0 && yspd == 0)
			{
				state = movementState;
			}
	}
#endregion


//get xspd and yspd based on button inputs
	if movementControl == true
	{
		xspd = (rightKey - leftKey) * moveSpd;
		yspd = (downKey - upKey) * moveSpd;
	}

//set sprites
	mask_index = sprite[DOWN];
	if autoSpriteControl == true
	{
		if yspd == 0
		{
			if xspd > 0 {face = RIGHT};
			if xspd < 0 {face = LEFT};
		}
		if xspd > 0 && face == LEFT {face = RIGHT};
		if xspd < 0 && face == RIGHT {face = LEFT};
		if xspd == 0
		{
			if yspd > 0 {face = DOWN};
			if yspd < 0 {face = UP};
		}
		if yspd > 0 && face == UP {face = DOWN};
		if yspd < 0 && face == DOWN {face = UP};
		sprite_index = sprite[face];
	}
   
//collisions
	//diagonal ice collision
	if xspd != 0 && yspd != 0
	{
		if place_meeting(x + xspd, y, oIceGround) {xspd = 0;};
		if place_meeting(x, y + yspd, oIceGround) {yspd = 0;};
	}

	if place_meeting(x + xspd, y, Obj_wall)
	{
		var _pixelCheck = sign(xspd);
		while !place_meeting(x + _pixelCheck, y, Obj_wall) { x += _pixelCheck; };
		
		xspd = 0;
	}
	if place_meeting(x + xspd, y + yspd, Obj_wall)
	{
		var _pixelCheck = sign(yspd);
		while !place_meeting(x + xspd, y + _pixelCheck, Obj_wall) { y += _pixelCheck; };
		
		yspd = 0;
	}

//actually move
	x += xspd;
	y += yspd;

/*/move_and_collide version
	var _arrayX = move_and_collide(xspd, 0, Obj_wall);
	if array_length(_arrayX) > 0 { xspd = 0; };

	var _arrayY = move_and_collide(0, yspd, Obj_wall);
	if array_length(_arrayY) > 0 { yspd = 0; };//*/

//animate
	if animate == true
	{
		image_speed = 1;
		if xspd == 0 && yspd == 0
		{
			image_index = 0;	
		}
	} else {
		image_speed = 0;	
	}

//get depth
	depth = -bbox_bottom;
	
///////////////////////////



//interact with the push blocks
if interactKeyPressed == true
{
	//find the 360 degree direction to check for push blocks
	var _checkDir = face * 90;
	
	//see if we find a push block
	var _checkX = x + lengthdir_x(interactDist, _checkDir);
	var _checkY = y + lengthdir_y(interactDist, _checkDir);
	var _pushBlockInst = instance_place(_checkX, _checkY, oPushblock);
	
	//if there is a pushblock, tell it to slide and which direction to slide
	if instance_exists(_pushBlockInst) && _pushBlockInst.sliding == false
	{
		_pushBlockInst.sliding = true;
		_pushBlockInst.faceDir = face;
	}
}

