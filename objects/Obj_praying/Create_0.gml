
// Create Event for your animation object
sprite_index = Spr_praying;
image_speed = 1;
image_index = 0;
animation_phase = 0;

// Store the origin offset information
origin_x = sprite_get_xoffset(sprite_index);
origin_y = sprite_get_yoffset(sprite_index);

// Use these variables to track position
base_x = x;
base_y = y;

// Make camera follow this object
if (view_enabled) {
    camera_set_view_target(view_camera[0], id);
}