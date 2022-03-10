/// scr_projectile_targeting

// checks for any objects in line of sight (or facing)

switch (facing)
    {
        case 1:
            vertical = 0;
            horizontal = 1;
            break;
        case 2:
            vertical = -1;
            horizontal = 1;
            break;
        case 3:
            vertical = -1;
            horizontal = 0;
            break;
        case 4:
            vertical = -1;
            horizontal = -1;
            break;
        case 5:
            vertical = 0;
            horizontal = -1;
            break;
        case 6:
            vertical = 1;
            horizontal = -1;
            break;
        case 7:
            vertical = 1;
            horizontal = 0;
            break;
        case 8:
            vertical = 1;
            horizontal = 1;
            break;
    }
    
var check_cell_x = current_grid_xpos;
var check_cell_y = current_grid_ypos;
    
while true
    {
        check_cell_x += horizontal;
        check_cell_y += vertical;
        var check_cell = obj_dungeon_master.dungeon_map[# check_cell_x, check_cell_y];
        if check_cell != UNOCCUPIED
            {
                if check_cell == WALL
                    {
                        var wall_x = scr_coord_convert(check_cell_x);
                        var wall_y = scr_coord_convert(check_cell_y);
                        return instance_position(wall_x, wall_y, obj_wall);
                    } else if check_cell.object_index == obj_stairs
                    {
                        continue;
                    }
                    else
                    {
                        var target_object = check_cell;
                        return target_object;
                    }
            }
    }

