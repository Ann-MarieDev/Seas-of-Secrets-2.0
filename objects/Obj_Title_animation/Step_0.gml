
// Play the animation if it hasn't reached the last frame
if (image_index < sprite_get_number(sprite_index) - 1) {
    image_speed = 1; // Keep playing the animation
} else {
    image_speed = 0; // Stop the animation once it reaches the last frame
    image_index = sprite_get_number(sprite_index) - 1; // Freeze on the last frame
}
