/// scr_check_move_validity(argument0, argument1)

target_xpos = argument0;
target_ypos = argument1;

// Check if target coordinates is out of bounds

if (target_xpos < 0) or (target_ypos < 0)
    {
        return false;
    }

// Can move into stairs    

if obj_dungeon_master.dungeon_map[# target_xpos, target_ypos].object_index == obj_stairs
    {
        return true
    }
    
// Check if there is an obstacle

if (obj_dungeon_master.dungeon_map[# target_xpos, target_ypos] != UNOCCUPIED)
    {
        return false;
    }
    
// Check if diagonal movement goes into a tunnel

if (abs(current_grid_xpos - target_xpos) > 0) and (abs(current_grid_ypos - target_ypos) > 0)
    {
        if (obj_dungeon_master.dungeon_map[# target_xpos, current_grid_ypos] == WALL) or (obj_dungeon_master.dungeon_map[# current_grid_xpos, target_ypos] == WALL)
            {
                return false;
            }
    }
    
return true
