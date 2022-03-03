function test_animation_manager_variables_on_init_name() {
    assertEqual(parent.manager.name, "test manager", "Expected name to be \"test manager\".");
}

function test_animation_manager_variables_on_init_sprite() {
    assertEqual(parent.manager.sprite, spr_pixel_platformer_player, "Expected sprite_index to be spr_pixel_platformer_player (" + string(spr_pixel_platformer_player) + ").");
}

function test_animation_manager_variables_on_init_use_delta_time() {
    assertFalse(parent.manager.use_delta_time, "Expected use_delta_time to be false.");
}

function test_animation_manager_variables_on_init_flags() {
    assertEqual(typeof(parent.manager.flags), "number", "Expected flags to be a real number.");
}

function test_animation_manager_variables_on_init_flags_order() {
    assertTrue(is_array(parent.manager.__flags_order__), "Expected __flags__order__ to be an array.");
}

function test_animation_manager_variables_on_init_flags_order_length() {
    assertEqual(array_length(parent.manager.__flags_order__), 0, "Expected __flags__order__ array to have a length of 0.");
}

function test_animation_manager_variables_on_init_active_flag() {
    assertIsUndefined(parent.manager.active_flag, "Expected active_flag to be undefined.");
}

function test_animation_manager_variables_on_init_state() {
    assertEqual(parent.manager.state, ANIMATION_MANAGER_STATES.RUN, "Expected state to be ANIMATION_MANAGER_STATES.RUN (" + string(ANIMATION_MANAGER_STATES.RUN) + ").");
}
