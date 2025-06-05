// Adjust volume based on distance from the object
var distance = point_distance(oPlayer.x, oPlayer.y, x, y);
var max_distance = 250;
var volume = 1 - clamp(distance / max_distance, 0, 1);

// Optional: overall volume scaling
var overall_volume = 0.3;
volume *= overall_volume;

// Apply volume change
audio_sound_gain(so_nala_attic, volume, 30);
