/// scr_highlight_tiles(argument0);

var facing = argument0;

switch (facing)
    {
        case 1:
            vertical = 0;
            horizontal = 1;
            break;
        case 2:
            vertical = -1;
            horizontal = 1;
            break;
        case 3:
            vertical = -1;
            horizontal = 0;
            break;
        case 4:
            vertical = -1;
            horizontal = -1;
            break;
        case 5:
            vertical = 0;
            horizontal = -1;
            break;
        case 6:
            vertical = 1;
            horizontal = -1;
            break;
        case 7:
            vertical = 1;
            horizontal = 0;
            break;
        case 8:
            vertical = 1;
            horizontal = 1;
            break;
    }
    
var highlight_x = current_grid_xpos;
var highlight_y = current_grid_ypos;
    
while true
    {
        highlight_x += horizontal;
        highlight_y += vertical;
        var highlight = obj_dungeon_master.dungeon_map[# highlight_x, highlight_y];
        if highlight != WALL
            {
                var highlight_coord_x = scr_coord_convert(highlight_x);
                var highlight_coord_y = scr_coord_convert(highlight_y);
                instance_create(highlight_coord_x, highlight_coord_y, obj_tile_highlight);
            } else break;
    }
