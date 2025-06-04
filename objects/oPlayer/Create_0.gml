//basic movement stuff
	//moving
	xspd = 0;
	yspd = 0;
	moveSpd = 1;

	//sprite control
	sprite[RIGHT] = sPlayerRight;
	sprite[UP] = sPlayerUp;
	sprite[LEFT] = sPlayerLeft;
	sprite[DOWN] = sPlayerDown;
	face = DOWN;

//player state control
state = 0;
	movementState = 0;
	slidingState = 1;
	
	//state information
	movementControl = true;	//get xspd and yspd based on button inputs
	autoSpriteControl = true; //control the sprite swapping
	animate = true; //control the actual animation

//for interaction
interactDist = 4;
