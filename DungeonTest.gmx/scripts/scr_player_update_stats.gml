/// scr_player_update_stats()

if hp < max_hp
    {
        if (hp + hp_regen > max_hp) hp = max_hp;
        else hp += hp_regen;
    }
if (mp < max_mp)
    {
        if (mp + mp_regen > max_mp) mp = max_mp;
        else mp += mp_regen
    }
if (barrier < max_barrier)
    {
        if (barrier + barrier_regen > max_barrier) barrier = max_barrier;
        else barrier += barrier_regen;
    }
update_stats = false;
