/**
 * Testing AnimationManager variables on init
 */
function test_animationManagerName_withStringTestManagerPassed_shouldBeStringTestManager() {
    var _animator = parent.animator;
    assertEqual(_animator.name, "test animator", "Expected animator.name to be \"test animator\".");
}

function test_animationManagerSprite_withSpriteIndexPassed_shouldBeSpriteIndex() {
    var _animator = parent.animator;
    assertEqual(_animator.sprite, spr_pixel_platformer_player, "Expected animator.sprite to be the sprite_index spr_pixel_platformer_player (id: " + string(spr_pixel_platformer_player) + ").");
}

function test_animationManagerUseDeltaTime_withUseDeltaTimeOmitted_shouldbeFalse() {
    var _animator = parent.animator;
    assertFalse(_animator.use_delta_time, "Expected animator.use_delta_time to be false.");
}

function test_animationManagerUseDeltaTime_withUseDeltaTimeFalse_shouldBeFalse() {
    var _animator = new AnimationManager("test animator use_delta_time false", spr_pixel_platformer_player, false);
    assertFalse(_animator.use_delta_time, "Expected animator.use_delta_time to be false.");
}

function test_animationManagerUseDeltaTime_withUseDeltaTimeTrue_shouldBeTrue() {
    var _animator = new AnimationManager("test animator use_delta_time true", spr_pixel_platformer_player, true);
    assertTrue(_animator.use_delta_time, "Expected animator.use_delta_time to be true.");
}

function test_animationManagerFlags_withInit_shouldBeNumberPointerToDsMap() {
    var _animator = parent.animator;
    assertTrue(is_struct(_animator.flags), "Expected is_struct(animator.flags) to be true.");
}

function test_animationManagerFlagsOrder_withInit_shouldBeAnArray() {
    var _animator = parent.animator;
    assertTrue(is_array(_animator.__flags_order__), "Expected animator.__flags__order__ to be an array.");
}

function test_animationManagerFlagsOrder_withInit_shouldBeEmpty() {
    var _animator = parent.animator;
    assertEqual(array_length(_animator.__flags_order__), 0, "Expected animator.__flags__order__ array to have a length of 0.");
}

function test_animationManagerActiveFlag_withInit_shouldBeUndefined() {
    var _animator = parent.animator;
    assertIsUndefined(_animator.active_flag, "Expected animator.active_flag to be undefined.");
}

function test_animationManagerState_withInit_shouldBeRun() {
    var _animator = parent.animator;
    assertEqual(_animator.state, ANIMATION_MANAGER_STATES.RUN, "Expected animator.state to be ANIMATION_MANAGER_STATES.RUN (" + string(ANIMATION_MANAGER_STATES.RUN) + ").");
}


/**
 * Testing AnimationManager add_flag
 */
function test_animationManagerFlagsSize_withAddFlag_shouldBe1() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertEqual(_animator.get_flags_number(), 1, "Expected animator.flags size to be 1.");
}

function test_animationManagerFlags_withAddFlag_shouldHaveKeyTestFlag() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertTrue(variable_struct_exists(_animator.flags, _test_flag.name), "Expected animator.flags to have the key \"test flag\".");
}

function test_animationManagerFlagsTestFlagKey_withAddFlag_shouldBeTestFlag() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertEqual(_animator.flags[$ _test_flag.name], _test_flag, "Expected animator.flags[$ \"test flag\"] to be test_flag.");
}

function test_animationManagerFlagsOrderAtPosition0_withAddFlag_shouldBeTestFlagName() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertEqual(_animator.__flags_order__[0], _test_flag.name, "Expected index 0 of animator.__flags_order__ to be \"test flag\".");
}

function test_animationManagerAddedFlagParent_withAddFlag_shouldNotBeUndefined() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertIsNotUndefined(_test_flag.parent, "Expected added test_flag.parent to not be undefined.");
}

function test_animationManagerAddedFlagParent_withAddFlag_shouldBeAnimationManager() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertEqual(_test_flag.parent, _animator, "Expected added test_flag.parent to be animator.");
}


/**
 * Testing AnimationManager update_flag
 */
function test_animationManagerGetFlagsNumber_withUpdateNonExistingFlag_shouldBe1() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.update_flag("flag not added", _test_flag);
    assertEqual(_animator.get_flags_number(), 1, "Expected animator.get_flags_number() size to be 1.");
}

function test_animationManagerGetFlagsNumber_withUpdateExistingFlag_shouldBe1() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    var _new_flag = new AnimationFlag("new flag", 10, 19, 0.15);
    _animator.add_flag(_test_flag);
    _animator.update_flag(_test_flag.name, _new_flag);
    assertEqual(_animator.get_flags_number(), 1, "Expected animator.get_flags_number() size to be 1.");
}

function test_animationManagerFlagExistsOldFlag_withUpdateExistingFlag_shouldBeFalse() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    var _new_flag = new AnimationFlag("new flag", 10, 19, 0.15);
    _animator.add_flag(_test_flag);
    _animator.update_flag(_test_flag.name, _new_flag);
    assertFalse(_animator.flag_exists(_test_flag.name), "Expected animator.flag_exists(test_flag.name) to be false.");
}

function test_animationManagerGetActiveFlag_withUpdateExistingFlagSet_shouldBeNewFlag() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    var _new_flag = new AnimationFlag("new flag", 10, 19, 0.15);
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name);
    _animator.update_flag(_test_flag.name, _new_flag);
    assertEqual(_animator.get_active_flag(), _new_flag, "Expected animator.get_active_flag() to be new_flag.");
}

function test_animationManagerActiveFlag_withUpdateExistingFlagSet_shouldBeNewFlagName() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    var _new_flag = new AnimationFlag("new flag", 10, 19, 0.15);
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name);
    _animator.update_flag(_test_flag.name, _new_flag);
    assertEqual(_animator.active_flag, _new_flag.name, "Expected animator.active_flag to be new_flag.name.");
}

function test_animationManagerFlagsOrderPosition_withUpdateExistingFlagSet_shouldBeAtOldFlagPosition() {
    var _animator = parent.animator;
    var _flag_position_0 = new AnimationFlag("flag_position_0", 0, 9, 0.15);
    var _flag_position_1 = new AnimationFlag("flag_position_1", 10, 19, 0.15);
    var _flag_position_2 = new AnimationFlag("flag_position_2", 20, 29, 0.15);
    _animator.add_flag(_flag_position_0);
    _animator.set_flag("flag_position_0");
    _animator.add_flag(_flag_position_1);
    _animator.update_flag("flag_position_0", _flag_position_2);
    assertEqual(_animator.get_flag_position("flag_position_2"), 0, "Expected _animator.get_flag_position(\"flag_position_2\") to be 0.");
}


/**
 * Testing AnimationManager remove_flag
 */
function test_animationManagerFlagsSize_withRemoveFlag_shouldBe0() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.remove_flag(_test_flag.name);
    assertEqual(_animator.get_flags_number(), 0, "Expected animator.flags size to be 0.");
}

function test_animationManagerFlags_withRemoveFlag_shouldNotFindTestFlagNameInFlags() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.remove_flag(_test_flag.name);
    assertFalse(variable_struct_exists(_animator.flags, _test_flag.name), "Expected variable_struct_exists(animator.flags, test_flag.name) to be false.");
}

function test_animationManagerFlagsOrderLength_withRemoveFlag_shouldBe0() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.remove_flag(_test_flag.name);
    assertEqual(array_length(_animator.__flags_order__), 0, "Expected animator.__flags_order__ array length to be 0.");
}

function test_animationManagerRemovedFlagParent_withRemoveFlag_shouldBeUndefined() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.remove_flag(_test_flag.name);
    assertIsUndefined(_test_flag.parent, "Expected removed test_flag.parent to be undefined.");
}


/**
 * Testing AnimationManager set_flag
 */
function test_animationManagerActiveFlag_withSetFlagNotExistingFlag_shouldBeUndefined() {
    var _animator = parent.animator;
    _animator.set_flag("flag not added");
    assertIsUndefined(_animator.active_flag, "Expected animator.active_flag to be undefined.");
}

function test_animationManagerActiveFlag_withSetFlag_shouldBeTestFlagName() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name);
    assertEqual(_animator.active_flag, _test_flag.name, "Expected animator.active_flag to be \"test flag\".");
}

function test_animationManagerActiveFlagsOrderIndex0_withSetFlag_shouldBeTestFlagName() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name);
    assertEqual(_animator.__flags_order__[0], _test_flag.name, "Expected animator.__flags_order[0] to be \"test flag\".");
}

function test_animationManagerGetActiveFlagGet_withSetFlagResetOmitted_shouldBe0() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _test_flag.index = 1;
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name);
    assertEqual(_animator.get_active_flag().get(), 0, "Expected animator.get_active_flag().get() to be 0.");
}

function test_animationManagerGetActiveFlagGet_withSetFlagResetFalse_shouldBe1() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _test_flag.index = 1;
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name, false);
    assertEqual(_animator.get_active_flag().get(), 1, "Expected animator.get_active_flag().get() to be 1.");
}


/**
 * Testing AnimationManager get_flags_number
 */
function test_animationManagerGetFlagsNumber_withNoAddedFlag_shouldBe0() {
    var _animator = parent.animator;
    assertEqual(_animator.get_flags_number(), 0, "Expected animator.get_flags_number() to be 0.");
}

function test_animationManagerGetFlagsNumber_withAddFlag_shouldBe1() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertEqual(_animator.get_flags_number(), 1, "Expected animator.get_flags_number() to be 1.");
}

function test_animationManagerGetFlagsNumber_withRemoveFlag_shouldBe0() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.remove_flag(_test_flag.name);
    assertEqual(_animator.get_flags_number(), 0, "Expected animator.get_flags_number() to be 0.");
}


/**
 * Testing AnimationManager get_flag
 */
function test_animationManagerGetFlag_withAddFlag_shouldBeTestFlag() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertEqual(_animator.get_flag(_test_flag.name), _test_flag, "Expected animator.get_flag() to be test_flag.");
}

function test_animationManagerGetFlag_withNonExistingFlag_shouldBeUndefined() {
    var _animator = parent.animator;
    assertIsUndefined(_animator.get_flag("flag not added"), "Expected animator.get_flag() to return undefined.");
}


/**
 * Testing AnimationManager get_flag_position
 */
function test_animationManagerGetFlagPosition_withNonExistingFlag_shouldBeUndefined() {
    var _animator = parent.animator;
    assertIsUndefined(_animator.get_flag_position("flag not added"), "Expected animator.get_flag_position() to be undefined.");
}

function test_animationManagerGetFlagPosition_withFlagAdd_shouldBe0() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertEqual(_animator.get_flag_position(_test_flag.name), 0, "Expected animator.get_flag_position() to be 0.");
}

function test_animationManagerGetFlagPosition_withFlagRemove_shouldBeUndefined() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.remove_flag(_test_flag.name);
    assertIsUndefined(_animator.get_flag_position(_test_flag.name), "Expected animator.get_flag_position() to be undefined.");
}


/**
 * Testing AnimationManager get_flag_at_position
 */
function test_animationManagerGetFlagPosition_withNoFlagAdded_shouldBeUndefined() {
    var _animator = parent.animator;
    assertIsUndefined(_animator.get_flag_at_position(0), "Expected animator.get_flag_at_position(0) to be undefined.");
}

function test_animationManagerGetFlagPosition_withPositionBelowRange_shouldBeUndefined() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertIsUndefined(_animator.get_flag_at_position(-1), "Expected animator.get_flag_at_position(-1) to be undefined.");
}

function test_animationManagerGetFlagPosition_withPositionAboveRange_shouldBeUndefined() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertIsUndefined(_animator.get_flag_at_position(1), "Expected animator.get_flag_at_position(1) to be undefined.");
}

function test_animationManagerGetFlagPosition_withAddFlag_shouldBeTestFlag() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertEqual(_animator.get_flag_at_position(0), _test_flag, "Expected animator.get_flag_at_position(0) to be test_flag.");
}


/**
 * Testing AnimationManager get_active_flag
 */
function test_animationManagerGetActiveFlag_withSetFlagNotExistingFlag_shouldBeUndefined() {
    var _animator = parent.animator;
    _animator.set_flag("flag not added");
    assertIsUndefined(_animator.get_active_flag(), "Expected animator.get_active_flag() to be undefined.");
}

function test_animationManagerGetActiveFlag_withSetFlag_shouldBeTestFlag() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name);
    assertEqual(_animator.get_active_flag(), _test_flag, "Expected get_active_flag() to be \"test flag\".");
}


/**
 * Testing AnimationManager flag_exists
 */
function test_animationManagerFlagExists_withFlagNotAdded_shouldBeFalse() {
    var _animator = parent.animator;
    assertFalse(_animator.flag_exists("flag not added"), "Expected animator.flag_exists() to be false.");
}

function test_animationManagerFlagExists_withAddFlag_shouldBeTrue() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    assertTrue(_animator.flag_exists(_test_flag.name), "Expected animator.flag_exists() to be true.");
}


/**
 * Testing AnimationManager get_sprite_name
 */
function test_animationManagerGetSpriteName_withSpriteIndexPassed_shouldBeSpriteName() {
    var _animator = parent.animator;
    assertEqual(_animator.get_sprite_name(), "spr_pixel_platformer_player", "Expected animator.get_sprite_name() to be \"spr_pixel_platformer_player\".");
}

function test_animationManagerGetSpriteName_withNoonePassed_shouldBeNoone() {
    var _animator = new AnimationManager("test animator no sprite", noone);
    assertIsNoone(_animator.get_sprite_name(), "Expected animator.get_sprite_name() to be noone.");
}


/**
 * Testing AnimationManager set_delta_time
 */
function test_animationManagerSetDeltaTime_withTruePassed_shouldBeTrue() {
    var _animator = parent.animator;
    _animator.set_delta_time(true);
    assertTrue(_animator.use_delta_time, "Expected animator.use_delta_time to be true.");
}

function test_animationManagerSetDeltaTime_withFalsePassed_shouldBeFalse() {
    var _animator = parent.animator;
    _animator.set_delta_time(false);
    assertFalse(_animator.use_delta_time, "Expected animator.use_delta_time to be false.");
}


/**
 * Testing AnimationManager toString
 */
function test_animationManagerRepr_withNameAsString_shouldBeString() {
    var _animator = parent.animator;
    assertEqual(string(_animator), "<AnimationManager - test animator>", "Expected string(animator) to be \"<AnimationManager - test animator>\".");
}


/**
 * Testing AnimationManager run
 */
function test_animationManagerGetActiveFlagGet_withStateStop_shouldBe0() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.state = ANIMATION_MANAGER_STATES.STOP;
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name);
    _animator.run();
    assertEqual(_animator.get_active_flag().get(), 0, "Expected animator.get_active_flag().get() to be 0.");
}

function test_animationManagerGetActiveFlagGet_withUseDeltaTimeFalseAndStateRun_shouldBe0Point15() {
    var _animator = parent.animator;
    var _test_flag = parent.test_flag;
    _animator.add_flag(_test_flag);
    _animator.set_flag(_test_flag.name);
    _animator.run();
    assertEqual(_animator.get_active_flag().get(), 0.15, "Expected animator.get_active_flag().get() to be 0.15.");
}
