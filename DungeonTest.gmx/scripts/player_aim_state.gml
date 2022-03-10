///player_aim_state

// Update facing
        sprite[0] = sprite[facing];
        facing_previous = facing;
        if facing == 0 facing = facing_previous;
        if facing == 4 or facing == 6
            {
                image_xscale = -1
            } else if facing != 0
            {
                image_xscale = 1;
            }
        sprite_index = sprite[facing];
