/// layout3()

layout = ds_grid_create(8, 8);

ds_grid_clear(layout, WALL);
ds_grid_set_region(layout, 3, 3, 4, 5, UNOCCUPIED);

ds_grid_copy(room_layout, layout);
ds_grid_destroy(layout);
