/// scr_combustion

var combustion_level = obj_player_stats.combustion_level;
var cast_cost = COMBUSTION_BASE_COST - 2 * combustion_level;

if mp - cast_cost < 0
    {
        ds_queue_dequeue(obj_dungeon_master.turn_queue);
        ds_queue_enqueue(obj_dungeon_master.next_turn_queue, id);
        state = player_idle_state;
        exit;
    } else
    {
        mp -= cast_cost;
    }

instance_create(0, 0, obj_reticle);
obj_reticle.creator = id;
obj_reticle.spell = obj_combustion;
obj_reticle.reticle_grid_x = current_grid_xpos;
obj_reticle.reticle_grid_y = current_grid_ypos;
obj_reticle.reticle_width = 3;
obj_reticle.reticle_height = 3;

state = player_aim_state;

with obj_reticle
switch obj_player.facing
    {
        case 1:
            reticle_grid_x += 1;
            break;
        case 2:
            reticle_grid_x += 1;
            reticle_grid_y -= 1;
            break;
        case 3:
            reticle_grid_y -= 1;
            break;
        case 4:
            reticle_grid_x -= 1;
            reticle_grid_y -= 1;
        case 5:
            reticle_grid_x -= 1;
            break;
        case 6:
            reticle_grid_x -= 1;
            reticle_grid_y += 1;
            break;
        case 7:
            reticle_grid_y += 1;
            break;
        case 8:
            reticle_grid_x += 1;
            reticle_grid_y += 1;
            break;
    }   
