/// scr_generate_paths()

// For every base coordinate of every room

for (v = 0; v < 4; v += 1)
    {
        for (h = 0; h < 4; h += 1)
            {
                // Generate upwards branching path
                if (v != 0) // Does not generate path upwards on uppermost row
                {
                    // Generate paths branching out in 4 directions
                    while true // branch up
                        {
                            // Pick a starting point in the room
                            start_point_x = irandom_range((h * 8), (h * 8) + 7);
                            start_point_y = irandom_range((v * 8), (v * 8) + 7);
                            // If the start point is valid
                            if scr_check_start_point_validity(start_point_x, start_point_y, 2)
                            {
                                while scr_check_start_point_validity(start_point_x, start_point_y, 2)
                                {
                                    // Keep branching up until it is no longer valid
                                    dungeon_map[# start_point_x, start_point_y - 1] = UNOCCUPIED;
                                    start_point_y -= 1;
                                }
                                break;
                            }
                        }
                }
                if (v != 3) // Does not generate path downwards on bottom most row
                {
                    // Generate paths branching out in 4 directions
                    while true // branch down
                        {
                            // Pick a starting point in the room
                            start_point_x = irandom_range((h * 8), (h * 8) + 7);
                            start_point_y = irandom_range((v * 8), (v * 8) + 7);
                            // If the start point is valid
                            if scr_check_start_point_validity(start_point_x, start_point_y, 4)
                            {
                                while scr_check_start_point_validity(start_point_x, start_point_y, 4)
                                {
                                    // Keep branching up until it is no longer valid
                                    dungeon_map[# start_point_x, start_point_y + 1] = UNOCCUPIED;
                                    start_point_y += 1;
                                }
                                break;
                            }
                        }
                }
                if (h != 0) // Does not generate path leftwards on leftmost column
                {
                    // Generate paths branching out in 4 directions
                    while true // branch left
                        {
                            // Pick a starting point in the room
                            start_point_x = irandom_range((h * 8), (h * 8) + 7);
                            start_point_y = irandom_range((v * 8), (v * 8) + 7);
                            // If the start point is valid
                            if scr_check_start_point_validity(start_point_x, start_point_y, 3)
                            {
                                while scr_check_start_point_validity(start_point_x, start_point_y, 3)
                                {
                                    // Keep branching up until it is no longer valid
                                    dungeon_map[# start_point_x - 1, start_point_y] = UNOCCUPIED;
                                    start_point_x -= 1;
                                }
                                break;
                            }
                        }
                }
                if (h != 3) // Does not generate path rightwards on rightmost column
                {
                    // Generate paths branching out in 4 directions
                    while true // branch left
                        {
                            // Pick a starting point in the room
                            start_point_x = irandom_range((h * 8), (h * 8) + 7);
                            start_point_y = irandom_range((v * 8), (v * 8) + 7);
                            // If the start point is valid
                            if scr_check_start_point_validity(start_point_x, start_point_y, 1)
                            {
                                while scr_check_start_point_validity(start_point_x, start_point_y, 1)
                                {
                                    // Keep branching up until it is no longer valid
                                    dungeon_map[# start_point_x + 1, start_point_y] = UNOCCUPIED;
                                    start_point_x += 1;
                                }
                                break;
                            }
                        }
                }
            }
    }
