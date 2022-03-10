///scr_move_order(argument0, argument1)

var direct = argument0;
var magnitude = argument1;

// Determine target coord in dungeon_map grid
switch (direct)
    {
        case 1:
            target_coord_x = current_grid_xpos + magnitude;
            target_coord_y = current_grid_ypos;
            break;
        case 2:
            target_coord_x = current_grid_xpos + magnitude;
            target_coord_y = current_grid_ypos - magnitude;
            break;
        case 3:
            target_coord_x = current_grid_xpos;
            target_coord_y = current_grid_ypos - magnitude;
            break;
        case 4:
            target_coord_x = current_grid_xpos - magnitude;
            target_coord_y = current_grid_ypos - magnitude;
            break;
        case 5:
            target_coord_x = current_grid_xpos - magnitude;
            target_coord_y = current_grid_ypos;
            break;
        case 6:
            target_coord_x = current_grid_xpos - magnitude;
            target_coord_y = current_grid_ypos + magnitude;
            break;
        case 7:
            target_coord_x = current_grid_xpos;
            target_coord_y = current_grid_ypos + magnitude;
            break;
        case 8:
            target_coord_x = current_grid_xpos + magnitude;
            target_coord_y = current_grid_ypos + magnitude;
            break;
    }
