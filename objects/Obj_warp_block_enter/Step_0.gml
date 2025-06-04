// Check if the player is pressing the Enter key
if keyboard_check_pressed(vk_enter) && !instance_exists(Obj_Transition)
{
    // Check if the player is in contact with the transition object
    if place_meeting(x, y, oPlayer)
    {
        var inst = instance_create_depth(0, 0, -9999, Obj_Transition);
        inst.target_x = target_x;
        inst.target_y = target_y;
        inst.target_rm = target_rm;
    }
}
