/// scr_organism_move(argument0, argument1, argument2)

movement_direction = argument0;
movement_magnitude = argument1;
movement_speed = argument2;

if (is_moving == 0)
{
    if (movement_direction > 0)
        {
            scr_move_order(movement_direction, movement_magnitude)
            // after calling this script the move_coord will have been modified
            if obj_dungeon_master.dungeon_map[# move_coord[0], move_coord[1]] != WALL
                {
                    scr_update_grid_position();
                    // Half the speed when moving diagonally
                    if (movement_direction mod 2 == 0) movement_direction = movement_direction / 2;
                    is_moving = 1;
                }
        }
} else {
    // if the organism has started moving, keep moving until reaching target tile
    if (x != target_x)
    {
        // Snap to center of tile
        if (abs(target_x - x) < movement_speed)
            {
                x += (target_x - x);
            }
        x += movement_speed * sign(target_x - x);
    }
    if (y != target_y)
    {
        if (abs(target_y - y) < movement_speed)
            {
                y += (target_y - y);
            }
        y += movement_speed * sign(target_y - y);
    }
    if (x == target_x) and (y == target_y)
    {
        is_moving = 0;
    }
}


