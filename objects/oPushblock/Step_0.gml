//what state are we in?
	//idle / not sliding
	if sliding == false
	{
		//set our starting coordinates	
		startPointX = x;
		startPointY = y;
		
		//reset movement speed
		xspd = 0;
		yspd = 0;
	}
	
	//get ground type
		//we're in recessed space
		if place_meeting(x, y, oPushBlockArea)
		{
			pushblockArea = true;	
		} else {
			pushblockArea = false;	
		}
		
		//we're on ice
		if place_meeting(x, y, oIceblock)
		{
			onIce = true;	
		} else {
			onIce = false;
		}
	
	//sliding
	if sliding == true
	{
		//get the actual 360 degree direction we should move in
		var _realDir = faceDir * 90;
		
		//get our target coordinates
		var _targetXDist = lengthdir_x(gridSpace, _realDir);
		var _targetYDist = lengthdir_y(gridSpace, _realDir);
		targetX = startPointX + _targetXDist;
		targetY = startPointY + _targetYDist;
		
		//if on ice - keep adding to the coordinates until edge of ice or wall
		if onIce == true
		{
			//reset our targetX and targetY
			targetX = startPointX;
			targetY = startPointY;
			
			//search each space ahead to make sure there IS ice, and there is NOT a wall
			while place_meeting( targetX + _targetXDist, targetY + _targetYDist, oIceblock )
			&& !place_meeting( targetX + _targetXDist, targetY + _targetYDist, oWall )
			{
				targetX += _targetXDist;
				targetY += _targetYDist;
			}
		}
		
		//set the speeds
		var _targetDist = point_distance( x, y, targetX, targetY );
		var _finalSpd = min( moveSpd, _targetDist );
		xspd = lengthdir_x( _finalSpd, _realDir );
		yspd = lengthdir_y( _finalSpd, _realDir );
		
		//cancel movement if we're currently in a push block area but our target coordinates aren't
		if pushblockArea == true && !place_meeting(targetX, targetY, oPushBlockArea)
		{
			xspd = 0;
			yspd = 0;
		}
		
		//dont let the block move to a grid space that has a wall in it
		if place_meeting(targetX, targetY, oWall)
		{
			xspd = 0;
			yspd = 0;
		}
	}
	
//move
x += xspd;
y += yspd;

//done with sliding
if xspd == 0 && yspd == 0
{
	sliding = false;	
}

//depth
depth = -bbox_bottom;
