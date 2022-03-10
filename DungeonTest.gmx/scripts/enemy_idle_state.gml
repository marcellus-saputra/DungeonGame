/// enemy_idle_state

if update_stats = true
    {
        scr_update_stats();
    }

if ds_queue_head(obj_dungeon_master.turn_queue) == id and hp > 0
    {
        // Check if player is adjacent
        var adjacent_player = scr_check_for_player_adjacent();
        if adjacent_player == true 
            {
                scr_melee_pathing();
                path_start(melee_path, 0, 0, 0);
                state = enemy_melee_state;
                exit;
            }
        
        if movement_target == 0
            {
                movement_target = scr_set_goal_adjacent_room();   
            }
        var movement_target_x = movement_target div 100;
        var movement_target_y = movement_target mod 100;
        
        if movement_target != 0
            {
                var target_coord = enemy_move_goal(current_grid_xpos, current_grid_ypos, movement_target_x, movement_target_y);
                if target_coord != 0
                {
                    target_coord_x = target_coord div 100;
                    target_coord_y = target_coord mod 100;
                    //show_debug_message("Target coords " + string(target_coord_x) + " " + string(target_coord_y));
                    //show_debug_message("Movement target " + string(movement_target_x) + " " + string(movement_target_y));
                    scr_update_grid_position();
                    state = move_state;
                }
                if current_grid_xpos * 100 + current_grid_ypos == movement_target
                    {
                        movement_target = 0;
                    }
            } 
        ds_queue_dequeue(obj_dungeon_master.turn_queue);
        ds_queue_enqueue(obj_dungeon_master.next_turn_queue, id);
    }

// Move the enemy

/*
if (ds_queue_head(obj_dungeon_master.turn_queue) == id)
    {
        if movement_direction > 0
            {
                state = move_state;
                scr_move_order(movement_direction, movement_magnitude);
                if target_coord_x != current_grid_xpos or  target_coord_y != current_grid_ypos
                        {
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
