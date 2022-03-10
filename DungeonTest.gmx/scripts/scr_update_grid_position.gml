/// scr_update_grid_position

obj_dungeon_master.dungeon_map[# current_grid_xpos, current_grid_ypos] = previous_tile;   
current_grid_xpos = target_coord_x;
current_grid_ypos = target_coord_y;
previous_tile = obj_dungeon_master.dungeon_map[# current_grid_xpos, current_grid_ypos];
obj_dungeon_master.dungeon_map[# current_grid_xpos, current_grid_ypos] = id;
target_x = scr_coord_convert(current_grid_xpos);
target_y = scr_coord_convert(current_grid_ypos);
