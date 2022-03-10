/// enemy_melee_state()

var melee_damage = 12;

if obj_player.state == player_idle_state
    {
        path_speed = 12;
    }

if point_distance(x, y,  obj_player.x, obj_player.y) < path_speed
    {
        path_position = 0.5;
    }

if path_position == 0.5
    {
        obj_player.hp -= melee_damage;
        damage_counter = instance_create(x, y, obj_damage_counter);
        damage_counter.damage_displayed = melee_damage;
    }

if path_position == 1
    {
        path_clear_points(melee_path);
        state = enemy_idle_state;
        path_delete(melee_path);
        scr_end_turn();
    }

