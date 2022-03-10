/// scr_check_start_point_validity(argument0, argument1, argument2)

xpos = argument0;
ypos = argument1;
dir = argument2;

// Must be on empty tile
if (dungeon_map[# xpos, ypos] != UNOCCUPIED) return false

// There must be a wall in the direction of generation
switch (dir)
    {
        case 1:
            if (dungeon_map[# xpos + 1, ypos] != WALL) return false;
            for (i = xpos + 1; i <= 31; i += 1)
                {
                    if (dungeon_map[# i, ypos] == UNOCCUPIED)
                        {
                            return true;
                        } else if (i == 31) and (dungeon_map[# i, ypos] != UNOCCUPIED) return false;
                }
            break;
        case 2:
            if (dungeon_map[# xpos, ypos - 1] != WALL) return false;
            for (i = ypos - 1; i >= 0; i -= 1)
                {
                    if (dungeon_map[# xpos, i] == UNOCCUPIED)
                        {
                            return true;
                        } else if (i == 0) and (dungeon_map[# xpos, i] != UNOCCUPIED) return false;
                }
            break;
        case 3:
            if (dungeon_map[# xpos - 1, ypos] != WALL) return false;
            for (i = xpos - 1; i >= 0; i -= 1)
                {
                    if (dungeon_map[# i, ypos] == UNOCCUPIED)
                        {
                            return true;
                        } else if (i == 0) and (dungeon_map[# i, ypos] != UNOCCUPIED) return false;
                }
            break;
        case 4:
            if (dungeon_map[# xpos, ypos + 1] != WALL) return false;
            for (i = ypos + 1; i <= 31; i += 1)
                {
                    if (dungeon_map[# xpos, i] == UNOCCUPIED)
                        {
                            return true;
                        } else if (i == 31) and (dungeon_map[# xpos, i] != UNOCCUPIED) return false;
                }
            break;
    }
    
return true
