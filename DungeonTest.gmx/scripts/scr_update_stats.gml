/// scr_update_stats

if hp < max_hp
    {
        if (hp + hp_regen) > max_hp hp = max_hp;
        else hp += hp_regen
    }
update_stats = false;
