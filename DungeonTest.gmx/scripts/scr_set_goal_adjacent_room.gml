/// scr_move_adjacent_room

var current_room_x = current_grid_xpos div 8
var current_room_y = current_grid_ypos div 8
var next_room_x = current_room_x;
var next_room_y = current_room_y;

var possible_directions;
possible_directions[3] = 0;
if current_room_x < 3 possible_directions[0] = 1;
if current_room_y > 0 possible_directions[1] = 1;
if current_room_x > 0 possible_directions[2] = 1;
if current_room_y < 3 possible_directions[3] = 1; 

while true
    {
        var i = irandom(3);
        if possible_directions[i] == 1
            {
                switch i
                    {
                        case 0:
                            next_room_x += 1;
                            break;
                        case 1:
                            next_room_y -= 1;
                            break;
                        case 2:
                            next_room_x -= 1;
                            break;
                        case 3:
                            next_room_y += 1;
                            break;
                    }
                break;
            }
        }

var target_cell_base_x = next_room_x * 8;
var target_cell_base_y = next_room_y * 8;

if target_cell_base_x != 0 target_cell_base_x -= 1;
if target_cell_base_y != 0 target_cell_base_y -= 1;

while true
    {
        var target_cell_x = irandom_range(target_cell_base_x, target_cell_base_x + 8);
        var target_cell_y = irandom_range(target_cell_base_y, target_cell_base_y + 8);
        if obj_dungeon_master.dungeon_room_map[# target_cell_x, target_cell_y] == UNOCCUPIED
            {
                return target_cell_x * 100 + target_cell_y;
            }
    }
