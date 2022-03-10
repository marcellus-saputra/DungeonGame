/// scr_end_turn

// Update turn queue
ds_queue_dequeue(obj_dungeon_master.turn_queue);
ds_queue_enqueue(obj_dungeon_master.next_turn_queue, id);

