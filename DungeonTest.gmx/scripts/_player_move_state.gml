/// move_state

// Move the player

/*if (ds_queue_head(obj_dungeon_master.turn_queue) == id)
    {
        movement_direction = scr_get_direction_input();
        movement_magnitude = 1;
        scr_organism_move(movement_direction, movement_magnitude, 8);
        //ds_queue_dequeue(obj_dungeon_master.turn_queue);
        //ds_queue_enqueue(obj_dungeon_master.turn_queue, id);
    }

// Check for stairs

//if (obj_dungeon_master.dungeon_map[# current_grid_xpos, current_grid_ypos] == STAIRS) state = pause_state
