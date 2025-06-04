//check if button is pressed
if place_meeting(x, y, oPushblock) || place_meeting(x, y, oPlayer)
{
	state = 1;	
} else {
	state = 0;	
}

//show the button is pressed
image_index = state;