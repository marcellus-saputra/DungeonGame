/// layout2()

layout = ds_grid_create(8, 8);

ds_grid_clear(layout, WALL);
ds_grid_set_region(layout, 5, 1, 6, 6, UNOCCUPIED);
ds_grid_set_region(layout, 3, 4, 4, 6, UNOCCUPIED);
layout[# 4, 3] = UNOCCUPIED;
layout[# 2, 6] = UNOCCUPIED;

ds_grid_copy(room_layout, layout);
ds_grid_destroy(layout);
