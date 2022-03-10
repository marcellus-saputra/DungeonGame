/// move_state

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
        state = enemy_idle_state;
        ds_queue_dequeue(obj_dungeon_master.turn_queue);
        ds_queue_enqueue(obj_dungeon_master.turn_queue, id);
    }
