function test_animation_flag_variables_on_init_name() {
    assertEqual(parent.test_flag.name, "test flag", "Expected name to be \"test flag\".");
}

function test_animation_flag_variables_on_init_start() {
    assertEqual(parent.test_flag.start, 0, "Expected start to be 0.");
}

function test_animation_flag_variables_on_init_stop() {
    assertEqual(parent.test_flag.stop, 9, "Expected stop to be 9.");
}

function test_animation_flag_variables_on_init_speed() {
    assertEqual(parent.test_flag.speed, 0.15, "Expected speed to be 0.15.");
}

function test_animation_flag_variables_on_init_index() {
    assertEqual(parent.test_flag.index, parent.test_flag.start, "Expected index to be start (" + string(parent.test_flag.start) + ").");
}

function test_animation_flag_variables_on_init_parent() {
    assertIsUndefined(parent.test_flag.parent, "Expected parent to be undefined.");
}
