/// layout1()

layout = ds_grid_create(8, 8);

ds_grid_clear(layout, WALL);
ds_grid_set_region(layout, 2, 1, 3, 5, UNOCCUPIED);

for (i = 3; i <= 5; i += 1) layout[# i, 2] = UNOCCUPIED;
layout[# 1, 3] = UNOCCUPIED;
layout[# 1, 5] = UNOCCUPIED;
layout[# 4, 4] = UNOCCUPIED;
layout[# 5, 4] = UNOCCUPIED;
layout[# 5, 5] = UNOCCUPIED;

ds_grid_copy(room_layout, layout);
ds_grid_destroy(layout);
