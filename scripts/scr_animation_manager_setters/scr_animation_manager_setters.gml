// set_flag
function test_animation_manager_set_flag_non_existing() {
    parent.manager.add_flag(parent.test_flag);
    parent.manager.set_flag("test flag");
    parent.manager.set_flag("flag non-existing");
    assertEqual(parent.manager.active_flag, parent.test_flag.name, "Expected manager.active_flag to be \"test flag\".");
    assertEqual(parent.manager.get_active_flag(), parent.test_flag, "Expected manager's.get_active_flag() to be parent.test_flag.");
}

function test_animation_manager_set_flag_existing_reset() {
    parent.test_flag.index = 1;
    parent.manager.add_flag(parent.test_flag);
    parent.manager.set_flag(parent.test_flag.name);
    assertEqual(parent.manager.active_flag, "test flag", "Expected manager.active_flag to be \"test flag\".");
    assertEqual(parent.manager.get_active_flag().get(), 0, "Expected parent.test_flag.get() to be reset to 0.");
}

function test_animation_manager_set_flag_existing_without_reset() {
    parent.test_flag.index = 1;
    parent.manager.add_flag(parent.test_flag);
    parent.manager.set_flag(parent.test_flag.name, false);
    assertEqual(parent.manager.active_flag, "test flag", "Expected manager.active_flag to be \"test flag\".");
    assertEqual(parent.manager.get_active_flag().get(), 1, "Expected parent.test_flag.get() to be 1.");
}
