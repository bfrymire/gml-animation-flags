/**
 * Testing AnimationFlag variables on init
 */
function test_animationFlagName_withStringTestFlagPassed_shouldBeStringTestFlag() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.name, "test flag", "Expected test_flag.name to be \"test flag\".");
}

function test_animationFlagStart_with0Passed_shouldBe0() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.start, 0, "Expected test_flag.start to be 0.");
}

function test_animationFlagStop_with9Passed_shouldBe9() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.stop, 9, "Expected test_flag.stop to be 9.");
}

function test_animationFlagSpeed_with0Point15Passed_shouldBe0Point15() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.speed, 0.15, "Expected test_flag.speed to be 0.15.");
}

function test_animationFlagIndex_with0StartPassed_shouldBe0() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.index, 0, "Expected test_flag.index to be 0.");
}

function test_animationFlagParent_withInit_shouldBeUndefined() {
    var _test_flag = parent.test_flag;
    assertIsUndefined(_test_flag.parent, "Expected test_flag.parent to be undefined.");
}

/**
 * Testing AnimationFlag get_flag_diff
 */
function test_animationFlagGetFlagDiff_withStart0Stop9_shouldBe10() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.get_flag_diff(), 10, "Expected test_flag.get_flag_diff() to be 10.");
}

function test_animationFlagGetFlagDiff_withStart0Stop0_shouldBe1() {
    var _test_flag = parent.test_flag;
    _test_flag.stop = 0;
    assertEqual(_test_flag.get_flag_diff(), 1, "Expected test_flag.get_flag_diff() to be 1.");
}

/**
 * Testing AnimationFlag get
 */
function test_animationFlagGet_withInit_shouldBe0() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.get(), 0, "Expected test_flag.get() to be 0.");
}


/**
 * Testing AnimationFlag reset
 */
function test_animationFlagGet_withStart0Index1AndReset_shouldBe0() {
    var _test_flag = parent.test_flag;
    _test_flag.index = 1;
    _test_flag.reset();
    assertEqual(_test_flag.get(), 0, "Expected test_flag.get() to be 0.");
}

/**
 * Testing AnimationFlag run
 */
function test_animationFlagGet_withParentUndefinedAndRun_shouldBe0() {
    var _test_flag = parent.test_flag;
    _test_flag.run();
    assertEqual(_test_flag.get(), 0, "Expected test_flag.get() to be 0.");
}

function test_animationFlagGet_withParentAndUseDeltaTimeFalseAndRun_shouldBe0Point15() {
    var _test_animator = new AnimationManager("test animator", spr_pixel_platformer_player);
    var _test_flag = parent.test_flag;
    _test_animator.add_flag(_test_flag);
    _test_flag.run();
    assertEqual(_test_flag.get(), 0.15, "Expected test_flag.get() to be 0.15.");
}

/**
 * Testing AnimationFlag __modulo__
 */
function test_animationFlagModulo_with0And0_shouldBe0() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.__modulo__(0, 0), 0, "Expected test_flag.__modulo__() to be 0.");
}

function test_animationFlagModulo_with0And1_shouldBe0() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.__modulo__(0, 1), 0, "Expected test_flag.__modulo__() to be 1.");
}

function test_animationFlagModulo_with5And1_shouldBe0() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.__modulo__(5, 1), 0, "Expected test_flag.__modulo__() to be 0.");
}

function test_animationFlagModulo_withNegative15And360_shouldBe345() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.__modulo__(-15, 360), 345, "Expected test_flag.__modulo__() to be 345.");
}

function test_animationFlagModulo_with15And360_shouldBe15() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.__modulo__(15, 360), 15, "Expected test_flag.__modulo__() to be 15.");
}

function test_animationFlagModulo_with0Point15And1_shouldBe0Point15() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.__modulo__(0.15, 1), 0.15, "Expected test_flag.__modulo__() to be 0.15.");
}

function test_animationFlagModulo_withNegative0Point15And1_shouldBe0Point85() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.__modulo__(-0.15, 1), 0.85, "Expected test_flag.__modulo__() to be 0.85.");
}

/**
 * Testing AnimationFlag repr
 */
function test_animationFlagRepr_withNameAndIndex0_shouldBeNameandIndex0() {
    var _test_flag = parent.test_flag;
    assertEqual(_test_flag.repr(), "<AnimationFlag - test flag 0>", "Expected test_flag.repr() to be \"<AnimationFlag - test flag 0>\".");
}

function test_animationFlagRepr_withNameAndIndex0Point15_shouldBeNameandIndex0() {
    var _test_flag = parent.test_flag;
    _test_flag.index = 0.15;
    assertEqual(_test_flag.repr(), "<AnimationFlag - test flag 0>", "Expected test_flag.repr() to be \"<AnimationFlag - test flag 0>\".");
}
