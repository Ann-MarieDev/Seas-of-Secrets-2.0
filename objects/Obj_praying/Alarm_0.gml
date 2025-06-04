// Alarm 0 Event
if (animation_phase == 1) {
    // Store current position
    base_x = x;
    base_y = y;
    player_spawn_x = x;  // Update spawn position
    player_spawn_y = y;
    
    // Calculate position adjustment for new sprite
    var old_xoffset = origin_x;
    var old_yoffset = origin_y;
    var new_xoffset = sprite_get_xoffset(sPlayerDown);
    var new_yoffset = sprite_get_yoffset(sPlayerDown);
    
    // Update sprite and adjust position to maintain visual alignment
    sprite_index = sPlayerDown;
    image_index = 0;
    image_speed = 0;
    
    // Adjust position to align with previous sprite
    x = base_x + (old_xoffset - new_xoffset);
    y = base_y + (old_yoffset - new_yoffset);
    
    animation_phase = 2;
}