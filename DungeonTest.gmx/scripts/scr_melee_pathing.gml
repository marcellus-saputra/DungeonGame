/// scr_melee_pathing

var player_x = scr_coord_convert(obj_player.current_grid_xpos);
var player_y = scr_coord_convert(obj_player.current_grid_ypos);
var self_x = scr_coord_convert(current_grid_xpos);
var self_y = scr_coord_convert(current_grid_ypos);

melee_path = path_add();

path_add_point(melee_path, self_x, self_y, 100);
path_add_point(melee_path, player_x, player_y, 100);
path_add_point(melee_path, self_x, self_y, 100);
