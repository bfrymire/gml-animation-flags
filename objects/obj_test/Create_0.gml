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


// Run tests
runner.run();

// Destroy self
instance_destroy();
