/// scr_check_for_player_adjacent()

for (v = current_grid_ypos - 1; v <= current_grid_ypos + 1; v++)
    {
        for (h = current_grid_xpos - 1; h <= current_grid_xpos + 1; h++)
            {
                if obj_dungeon_master.dungeon_map[# h, v] == obj_player.id
                    {
                        return true;
                    }
            }
    }

return false;
