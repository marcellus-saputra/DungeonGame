/// enemy_move_goal(argument0, argument1, argument2, argument3)

// based on Dijkstra's algorithm

origin_x = argument0;
origin_y = argument1;
goal_x = argument2;
goal_y = argument3;

// Grid that stores all nodes

node_grid = ds_grid_create(32, 32);
ds_grid_clear(node_grid, 128);
path_grid = ds_grid_create(32, 32);

// Copy map  layout

for (v = 0; v < 32; v++) for (h = 0; h < 32; h++)
    {
        if  obj_dungeon_master.dungeon_map[# h, v].object_index == obj_enemy_test node_grid[# h, v] = -2;
        else if  obj_dungeon_master.dungeon_map[# h, v] == 0 node_grid[# h, v] = -1;
        //if obj_dungeon_master.dungeon_map[# h, v] == obj_player.id node_grid[# h, v] = 128 //for testing purposes
    }
node_grid[# goal_x, goal_y] = 128;

// Set origin node to 0

node_grid[# origin_x, origin_y] = 0;
path_grid[# origin_x, origin_y] = 0;

// Check adjacent nodes

var distance_barrier = 0;
check_queue = ds_queue_create();

while true
    {
        // Queue all nodes within distance barrier
        for (v = 0; v < 32; v++) for (h = 0; h < 32; h++)
            {
                if node_grid[# h, v] == distance_barrier
                    {
                        var coord = h * 100 + v;
                        ds_queue_enqueue(check_queue, coord)
                    }
            }
        // Check surrounding nodes of every node on distance barrier
        while ds_queue_empty(check_queue) != true
            {
                current_x = ds_queue_head(check_queue) div 100;
                current_y = ds_queue_head(check_queue) mod 100;
                for (v = current_y - 1; v <= current_y + 1; v++)
                for (h = current_x - 1; h <= current_x + 1; h++)
                    {
                        if  node_grid[# h, v] > node_grid[# current_x, current_y] + 1
                        and node_grid[# h, v] > -1
                            {
                                node_grid[# h, v] = node_grid[# current_x, current_y] + 1;
                                path_grid[# h, v] = current_x * 100 + current_y;
                            }
                    }
                ds_queue_dequeue(check_queue);
            }
        distance_barrier += 1;
        
        // End loop conditions
        var goal_reached = false;
        if node_grid[# goal_x, goal_y] != 128 goal_reached = true;
        if goal_reached == true and node_grid[# goal_x, goal_y] < 128 break;
        if distance_barrier == 129 break;
    }

// If goal is unreachable, find the next closest path

if goal_reached == false
    {
        /*
        ds_queue_clear(check_queue);
        ds_queue_enqueue(check_queue, goal_x * 100 + goal_y);
        checked_coords = ds_list_create();
        distances_list = ds_list_create();
        
        // Find the minimum tentative distance value
        min_value = 128;
        for (i = 0; i < ds_list_size(distances_list) - 1; i++)
            {
                var coord = distances_list[| i];
                var coord_x = coord div 100;
                var coord_y = coord mod 100;
                if  node_grid[# coord_x, coord_y] < min_value
                    {
                        min_value = node_grid[# coord_x, coord_y];
                        path = path_grid[# coord_x, coord_y];
                    }
            }
        ds_list_destroy(checked_coords);
        ds_list_destroy(distances_list); */
        ds_grid_destroy(path_grid);
        ds_grid_destroy(node_grid);
        ds_queue_destroy(check_queue);
        return 0;
    } else var path = path_grid[# goal_x, goal_y];

// Retrace path

while true
    {
        show_debug_message("path " + string(path));
        var path_x = path div 100;
        var path_y = path mod 100;
        if path == 0 return 0;
        if node_grid[# goal_x, goal_y] == 1 return goal_x * 100 + goal_y;
        if path_grid[# path_x, path_y] != origin_x * 100 + origin_y
            {
                path = path_grid[# path_x, path_y];
            } else
            {
                // Clean up data structures
                /*ds_grid_destroy(path_grid);
                ds_grid_destroy(node_grid);
                ds_queue_destroy(check_queue);*/
                ds_grid_clear(path_grid, 0);
                ds_grid_clear(node_grid, 0);
                ds_queue_clear(check_queue);
                break;
            }
    }
return path_x * 100 + path_y;
