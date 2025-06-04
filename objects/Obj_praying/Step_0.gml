// Step Event
switch(animation_phase) {
    case 0:  // Initial animation playing
        if (image_index >= image_number - 1) {
            // Animation finished, switch to sPlayerLeft
            
            // Store current position
            base_x = x;
            base_y = y;
            player_spawn_x = x;  // Update spawn position
            player_spawn_y = y;
            
            // Calculate position adjustment for new sprite
            var old_xoffset = origin_x;
            var old_yoffset = origin_y;
            var new_xoffset = sprite_get_xoffset(sPlayerLeft);
            var new_yoffset = sprite_get_yoffset(sPlayerLeft);
            
            // Update sprite and adjust position to maintain visual alignment
            sprite_index = sPlayerLeft;
            image_index = 0;
            image_speed = 0;
            
            // Adjust position to align with previous sprite
            x = base_x + (old_xoffset - new_xoffset);
            y = base_y + (old_yoffset - new_yoffset);
            
            // Update origin tracking variables
            origin_x = new_xoffset;
            origin_y = new_yoffset;
            
            animation_phase = 1;
            alarm[0] = room_speed * 1;
        }
        break;
        
    case 1:  // Showing sPlayerLeft
        // Handled by alarm
        break;
        
    case 2:  // Showing sPlayerDown
        // Move to final phase
        animation_phase = 3;
        alarm[1] = room_speed * 0.5;  // Half second delay before destroying
        break;
        
    case 3:  // Waiting for destruction
        // Just waiting for alarm
        break;
}