// Create test runner
runner = new TestRunner("runner");
runner.tearDown(function() {
    output("\nThe above is not part of the AnimationFlags library and can be ignored by non-developers.\nUnit tests done.\n\n");
});

/**
 * Create test cases
 */
// AnimationManager variables on init test suite
test_animation_manager_variables_on_init_suite = new TestSuite("animation_manager_init_suite");
runner.addTestSuite(test_animation_manager_variables_on_init_suite);
test_animation_manager_variables_on_init_suite.setUp(function() {
    manager = new AnimationManager("test manager", spr_pixel_platformer_player);
});
runner.discover(test_animation_manager_variables_on_init_suite, "test_animation_manager_variables_on_init_");

// AnimationFlag variables on init test suite
animation_flag_variables_on_init_suite = new TestSuite("animation_flag_variables_on_init_suite");
runner.addTestSuite(animation_flag_variables_on_init_suite);
animation_flag_variables_on_init_suite.setUp(function() {
    flag = new AnimationFlag("test flag", 0, 9, 0.15);
});
runner.discover(animation_flag_variables_on_init_suite, "test_animation_flag_variables_on_init_");

// AnimationManager flag methods test suite
test_animation_manager_getters_suite = new TestSuite("animation_manager_flag_getters_suite");
runner.addTestSuite(test_animation_manager_getters_suite);
test_animation_manager_getters_suite.setUp(function() {
    manager = new AnimationManager("test manager", spr_pixel_platformer_player);
    flag = new AnimationFlag("test flag", 0, 9, 0.15);
});
runner.discover(test_animation_manager_getters_suite, "test_animation_manager_get_");


// Run tests
runner.run();

// Destroy self
instance_destroy();
