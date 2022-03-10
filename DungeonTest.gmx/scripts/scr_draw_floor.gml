/// scr_draw_floor()



for (v = 0; v <= 31; v += 1) {
    for (h = 0; h <= 31; h += 1) {
        x_position = scr_coord_convert(h);
        y_position = scr_coord_convert(v);
        switch (ds_grid_get(obj_dungeon_master.dungeon_map, h, v))
        {
            case WALL:
                instance_create(x_position, y_position, obj_wall);
                break;
            case UNOCCUPIED:
                instance_create(x_position, y_position, obj_ground);
                break;
        }
    }
}

obj_wall.sprite_index = tile_sprite[0];
obj_ground.sprite_index = tile_sprite[1];

// if used repeatedly will slow the game down due to making too many instances. need to find
// another way to refresh the floor map
