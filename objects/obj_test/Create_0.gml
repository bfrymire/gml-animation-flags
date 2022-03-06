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
// AnimationFlag test suite
suite_animation_flag = new TestSuite("suite_animation_flag");
runner.addTestSuite(suite_animation_flag);
suite_animation_flag.setUpPerTest(function() {
    test_flag = new AnimationFlag("test flag", 0, 9, 0.15);
});
runner.discover(suite_animation_flag, "test_animationFlag");

// AnimationManager test suite
suite_animation_manager = new TestSuite("suite_animation_manager");
runner.addTestSuite(suite_animation_manager);
suite_animation_manager.setUpPerTest(function() {
    animator = new AnimationManager("test animator", spr_pixel_platformer_player);
    test_flag = new AnimationFlag("test flag", 0, 9, 0.15);
});
runner.discover(suite_animation_manager, "test_animationManager");


// Run tests
runner.run();

// Destroy self
instance_destroy();
