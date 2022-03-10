/// scr_generate_room(argument0, argument1)

base_x = argument0;
base_y = argument1;

room_layout = ds_grid_create(8, 8);

// From list of all possible rooms, generate 16 rooms
script_execute(room_list[random_range(0, array_length_1d(room_list))]);

// Copy room_layout into a specific portion of dungeon_map and dungeon_room_map
for (v = 0; v <= 7; v += 1)
    {
        for (h = 0; h <= 7; h += 1)
            {
                dungeon_map[# (base_x + h), (base_y + v)] = room_layout[# h, v];
                dungeon_room_map[# (base_x + h), (base_y + v)] = room_layout[# h, v];
            }
    }
    
ds_grid_destroy(room_layout);
