/// scr_spawn(argument0)

obj = argument0;

while true
    {
        var h = irandom(31);
        var v = irandom(31);
        if (dungeon_room_map[# h, v] == UNOCCUPIED)
            {
                var spawn_x = scr_coord_convert(h);
                var spawn_y = scr_coord_convert(v);
                
                object = instance_create(spawn_x, spawn_y, obj);
                dungeon_map[# h, v] = object.id;
                object.previous_tile = UNOCCUPIED;
                break;
            }
    }
