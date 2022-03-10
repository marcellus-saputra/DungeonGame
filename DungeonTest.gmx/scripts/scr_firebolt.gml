/// scr_fireball(argument0)

var object_target = scr_linear_targeting();
var firebolt_level = obj_player_stats.firebolt_level;
var cast_cost = FIREBOLT_BASE_COST - 0.5 * firebolt_level;

if mp - cast_cost < 0 
    {
        ds_queue_dequeue(obj_dungeon_master.turn_queue);
        ds_queue_enqueue(obj_dungeon_master.next_turn_queue, id);
        state = player_idle_state;
    } else
    {
        mp -= cast_cost;
        fireball = instance_create(x, y, obj_firebolt);       
        fireball.creator = id;
        fireball.target = object_target;
        fireball.target_x = object_target.x;
        fireball.target_y = object_target.y;
    }


