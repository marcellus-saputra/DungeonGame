/// layout0()

layout = ds_grid_create(8, 8);

ds_grid_clear(layout, WALL);
ds_grid_set_region(layout, 1, 1, 5, 4, UNOCCUPIED);
layout[# 1, 4] = WALL;
layout[# 6, 2] = UNOCCUPIED;
layout[# 6, 3] = UNOCCUPIED;
layout[# 2, 5] = UNOCCUPIED;
layout[# 3, 5] = UNOCCUPIED;

ds_grid_copy(room_layout, layout);
ds_grid_destroy(layout);
