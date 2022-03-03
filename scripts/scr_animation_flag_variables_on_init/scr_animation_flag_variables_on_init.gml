function test_animation_flag_variables_on_init_name() {
    assertEqual(parent.flag.name, "test flag", "Expected name to be \"test flag\".");
}

function test_animation_flag_variables_on_init_start() {
    assertEqual(parent.flag.start, 0, "Expected start to be 0.");
}

function test_animation_flag_variables_on_init_stop() {
    assertEqual(parent.flag.stop, 9, "Expected stop to be 9.");
}

function test_animation_flag_variables_on_init_speed() {
    assertEqual(parent.flag.speed, 0.15, "Expected speed to be 0.15.");
}

function test_animation_flag_variables_on_init_index() {
    assertEqual(parent.flag.index, parent.flag.start, "Expected index to be start (" + string(parent.flag.start) + ").");
}

function test_animation_flag_variables_on_init_parent() {
    assertIsUndefined(parent.flag.parent, "Expected parent to be undefined.");
}
