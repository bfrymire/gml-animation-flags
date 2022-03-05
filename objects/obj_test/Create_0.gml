/**
 * Create test runner
 */
runner = new TestRunner("runner_animation_flags");
runner.tearDown(function() {
    output("\nThe above is not part of the AnimationFlags library and can be ignored by non-developers.\nUnit tests done.\n\n");
});

/**
 * Create test suites
 */

// AnimationManager test suite
test_animation_manager_suite = new TestSuite("animation_manager_suite");
runner.addTestSuite(test_animation_manager_suite);
test_animation_manager_suite.setUpPerTest(function() {
    manager = new AnimationManager("test manager", spr_pixel_platformer_player);
    test_flag = new AnimationFlag("test flag", 0, 9, 0.15);
});
runner.discover(test_animation_manager_suite, "test_animationManager");

// AnimationFlag variables on init test suite
animation_flag_variables_on_init_suite = new TestSuite("animation_flag_variables_on_init_suite");
runner.addTestSuite(animation_flag_variables_on_init_suite);
animation_flag_variables_on_init_suite.setUp(function() {
    test_flag = new AnimationFlag("test flag", 0, 9, 0.15);
});
runner.discover(animation_flag_variables_on_init_suite, "test_animation_flag_variables_on_init_");


// Run tests
runner.run();

// Destroy self
instance_destroy();
