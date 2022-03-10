/// player_idle_state

// Determine facing direction

if ds_queue_head(obj_dungeon_master.turn_queue) = id
    {
        // Update stats
        
        // Check for pause
        var pause = keyboard_check_pressed(vk_escape);
        if pause
            {
                state = player_pause_menu_state;
                instance_create(x, y, obj_pause_menu);
            }
            
        // Get facing and movement direction
        sprite[0] = sprite[facing];
        facing_previous = facing;
        facing = scr_input_direction();
        with obj_tile_highlight instance_destroy();
        if facing == 0 facing = facing_previous;
        if facing == 4 or facing == 6
            {
                image_xscale = -1
            } else if facing != 0
            {
                image_xscale = 1;
            }
        sprite_index = sprite[facing];
        
        // Check for attack
        if scr_input_attack()
            {
                state = player_cast_state;
                script_execute(obj_player_stats.spell_list[| 0]);
                exit;
            }
            
        // Check for quickspell
        var cast_spell = scr_quickbar();
        if cast_spell > 0
            {
                script_execute(obj_player_stats.spell_list[| cast_spell]);
            }
        
        // Check for highlighting tiles
        if keyboard_check(vk_shift) == 1
            {
                scr_highlight_tiles(facing);
            }
        
        // Movement
        if keyboard_check(vk_shift) == 0
            {
                movement_direction = scr_input_direction();
                if movement_direction > 0
                    {
                        scr_move_order(movement_direction, movement_magnitude);
                        if scr_check_move_validity(target_coord_x, target_coord_y)
                            {
                                scr_update_grid_position();
                                ds_queue_dequeue(obj_dungeon_master.turn_queue);
                                ds_queue_enqueue(obj_dungeon_master.next_turn_queue, id);
                                state = player_move_state;
                            } // else play sound effect
                    }
            }
    }


// If in turn, get input direction

// If player decides to move, check validity of move

// If move is valid, change position in grid and dequeue, change state

// if move is not valid, repeat


/*
movement_direction = scr_get_direction_input();
if (ds_queue_head(obj_dungeon_master.turn_queue) == id)
    {
        if movement_direction > 0 // if player decides to move
            {
                scr_move_order(movement_direction, movement_magnitude);
                    if target_coord_x != current_grid_xpos or target_coord_y != current_grid_ypos
                        {
                            state = player_move_state;
                            ds_queue_dequeue(obj_dungeon_master.turn_queue);
                            ds_queue_enqueue(obj_dungeon_master.next_turn_queue, id);
                            if obj_dungeon_master.dungeon_map[# target_coord_x, target_coord_y] != WALL
                                {
                                    scr_update_grid_position();
                                } else
                                {
                                    target_x = x;
                                    target_y = y;
                                }
                        }
            }
    }
