/// enemy_random_move()

// array of possible adjacent tiles to move to

var i = 0
var possible_moves;

possible_moves[0] = 0;

for (h = current_grid_xpos - 1; h <= current_grid_xpos + 1; h ++) 
    {
        for (v = current_grid_ypos - 1; v <= current_grid_ypos + 1; v++)
            {
                if scr_check_move_validity(h, v)
                    {
                        possible_moves[i] = 100*h + v;
                        i++
                    }
            }
    }

if possible_moves[0] == 0
    {
        return 0;
    } else
    {
        return possible_moves[irandom(array_length_1d(possible_moves) - 1)];
    }
