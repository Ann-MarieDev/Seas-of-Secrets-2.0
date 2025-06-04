//get pressed by the player
if place_meeting(x, y, oPlayer)
{
	state = 1;	
} else {
	state = 0;	
}

//reset all the pushblocks to their original positions
if state == 1
{
	with(oPushblock)
	{
		x = xstart;
		y = ystart;
	}
}

//show the button is pressed
image_index = state;

