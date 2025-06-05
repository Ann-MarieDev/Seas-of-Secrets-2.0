// Play the music only once when entering the room
if (!audio_is_playing(so_nala_attic)) {
    audio_play_sound(so_nala_attic, 1, true); // Play music, loop
}
