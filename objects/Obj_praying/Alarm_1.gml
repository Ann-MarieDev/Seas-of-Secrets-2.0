// Alarm 1 Event (final transition)
if (animation_phase == 3) {
    // Calculate precise spawn position that accounts for:
    // 1. Current position of animation object
    // 2. The origin point of the current sprite (sPlayerDown)
    // 3. The origin point of the player's starting sprite
    
    var anim_origin_x = sprite_get_xoffset(sprite_index);
    var anim_origin_y = sprite_get_yoffset(sprite_index);
    var player_sprite = object_get_sprite(oPlayer); // Get player's default sprite
    var player_origin_x = sprite_get_xoffset(player_sprite);
    var player_origin_y = sprite_get_yoffset(player_sprite);
    
    // Calculate the true world position of the animation object
    var true_x = x + (anim_origin_x - player_origin_x);
    var true_y = y + (anim_origin_y - player_origin_y);
    
    // Create player at the precisely calculated position
    var player = instance_create_layer(true_x, true_y, "player", oPlayer);
    
    // Make sure player appears with correct sprite and frame if needed
    with(player) {
        sprite_index = sPlayerDown; // Match ending animation sprite
        image_index = 0; // Use first frame
    }
    
    // Transfer camera to follow the player
    if (view_enabled) {
        camera_set_view_target(view_camera[0], player);
    }
    
    // Destroy the animation controller
    instance_destroy();
}