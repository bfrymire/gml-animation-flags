/**
 * Testing AnimationManager variables on init
 */
function test_animationManagerName_withStringTestManagerPassed_shouldBeStringTestManager() {
    assertEqual(parent.manager.name, "test manager", "Expected manager.name to be \"test manager\".");
}

function test_animationManagerSprite_withSpriteIndexPassed_shouldBeSpriteIndex() {
    assertEqual(parent.manager.sprite, spr_pixel_platformer_player, "Expected manager.sprite to be the sprite_index spr_pixel_platformer_player (id: " + string(spr_pixel_platformer_player) + ").");
}

function test_animationManagerUseDeltaTime_withUseDeltaTimeOmitted_shouldbeFalse() {
    assertFalse(parent.manager.use_delta_time, "Expected manager.use_delta_time to be false.");
}

function test_animationManagerUseDeltaTime_withUseDeltaTimeFalse_shouldBeFalse() {
    var _manager = new AnimationManager("test manager use_delta_time false", spr_pixel_platformer_player, false);
    assertFalse(_manager.use_delta_time, "Expected manager.use_delta_time to be false.");
}

function test_animationManagerUseDeltaTime_withUseDeltaTimeTrue_shouldBeTrue() {
    var _manager = new AnimationManager("test manager use_delta_time true", spr_pixel_platformer_player, true);
    assertTrue(_manager.use_delta_time, "Expected manager.use_delta_time to be true.");
}

function test_animationManagerFlags_withInit_shouldBeNumberPointerToDsMap() {
    // Checking for real number because AnimationManager.flags is a DS map
    assertEqual(typeof(parent.manager.flags), "number", "Expected manager.flags to be a real number.");
}

function test_animationManagerFlagsOrder_withInit_shouldBeAnArray() {
    assertTrue(is_array(parent.manager.__flags_order__), "Expected manager.__flags__order__ to be an array.");
}

function test_animationManagerFlagsOrder_withInit_shouldBeEmpty() {
    assertEqual(array_length(parent.manager.__flags_order__), 0, "Expected manager.__flags__order__ array to have a length of 0.");
}

function test_animationManagerActiveFlag_withInit_shouldBeUndefined() {
    assertIsUndefined(parent.manager.active_flag, "Expected manager.active_flag to be undefined.");
}

function test_animationManagerState_withInit_shouldBeRun() {
    assertEqual(parent.manager.state, ANIMATION_MANAGER_STATES.RUN, "Expected manager.state to be ANIMATION_MANAGER_STATES.RUN (" + string(ANIMATION_MANAGER_STATES.RUN) + ").");
}


/**
 * Testing AnimationManager add_flag
 */
function test_animationManagerFlagsSize_withAddFlag_shouldBe1() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertEqual(ds_map_size(_manager.flags), 1, "Expected manager.flags size to be 1.");
}

function test_animationManagerFlags_withAddFlag_shouldHaveKeyTestFlag() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertTrue(ds_map_exists(_manager.flags, _test_flag.name), "Expected manager.flags to have the key \"test flag\".");
}

function test_animationManagerFlagsTestFlagKey_withAddFlag_shouldBeTestFlag() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertEqual(_manager.flags[? _test_flag.name], _test_flag, "Expected manager.flags[? \"test flag\"] to be test_flag.");
}

function test_animationManagerFlagsOrderAtPosition0_withAddFlag_shouldBeTestFlagName() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertEqual(_manager.__flags_order__[0], _test_flag.name, "Expected index 0 of manager.__flags_order__ to be \"test flag\".");
}

function test_animationManagerAddedFlagParent_withAddFlag_shouldNotBeUndefined() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertIsNotUndefined(_test_flag.parent, "Expected added test_flag.parent to not be undefined.");
}

function test_animationManagerAddedFlagParent_withAddFlag_shouldBeAnimationManager() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertEqual(_test_flag.parent, _manager, "Expected added test_flag.parent to be manager.");
}


/**
 * Testing AnimationManager remove_flag
 */
function test_animationManagerFlagsSize_withRemoveFlag_shouldBe0() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    _manager.remove_flag(_test_flag.name);
    assertEqual(ds_map_size(_manager.flags), 0, "Expected manager.flags size to be 0.");
}

function test_animationManagerFlagsOrderLength_withRemoveFlag_shouldBe0() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    _manager.remove_flag(_test_flag.name);
    assertEqual(array_length(_manager.__flags_order__), 0, "Expected manager.__flags_order__ array length to be 0.");
}

function test_animationManagerRemovedFlagParent_withRemoveFlag_shouldBeUndefined() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    _manager.remove_flag(_test_flag.name);
    assertIsUndefined(_test_flag.parent, "Expected removed test_flag.parent to be undefined.");
}


/**
 * Testing AnimationManager set_flag
 */
function test_animationManagerActiveFlag_withSetFlagNotExistingFlag_shouldBeUndefined() {
    var _manager = parent.manager;
    _manager.set_flag("flag not added");
    assertIsUndefined(_manager.active_flag, "Expected manager.active_flag to be undefined.");
}

function test_animationManagerActiveFlag_withSetFlag_shouldBeTestFlagName() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    _manager.set_flag(_test_flag.name);
    assertEqual(_manager.active_flag, _test_flag.name, "Expected manager.active_flag to be \"test flag\".");
}

function test_animationManagerActiveFlagsOrderIndex0_withSetFlag_shouldBeTestFlagName() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    _manager.set_flag(_test_flag.name);
    assertEqual(_manager.__flags_order__[0], _test_flag.name, "Expected manager.__flags_order[0] to be \"test flag\".");
}

function test_animationManagerGetActiveFlagGet_withSetFlagResetOmitted_shouldBe0() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _test_flag.index = 1;
    _manager.add_flag(_test_flag);
    _manager.set_flag(_test_flag.name);
    assertEqual(_manager.get_active_flag().get(), 0, "Expected manager.get_active_flag().get() to be 0.");
}

function test_animationManagerGetActiveFlagGet_withSetFlagResetFalse_shouldBe1() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _test_flag.index = 1;
    _manager.add_flag(_test_flag);
    _manager.set_flag(_test_flag.name, false);
    assertEqual(_manager.get_active_flag().get(), 1, "Expected manager.get_active_flag().get() to be 1.");
}


/**
 * Testing AnimationManager get_flags_number
 */
function test_animationManagerGetFlagsNumber_withNoAddedFlag_shouldBe0() {
    var _manager = parent.manager;
    assertEqual(_manager.get_flags_number(), 0, "Expected manager.get_flags_number() to be 0.");
}

function test_animationManagerGetFlagsNumber_withAddFlag_shouldBe1() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertEqual(_manager.get_flags_number(), 1, "Expected manager.get_flags_number() to be 1.");
}

function test_animationManagerGetFlagsNumber_withRemoveFlag_shouldBe0() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    _manager.remove_flag(_test_flag.name);
    assertEqual(_manager.get_flags_number(), 0, "Expected manager.get_flags_number() to be 0.");
}


/**
 * Testing AnimationManager get_flag
 */
function test_animationManagerGetFlag_withAddFlag_shouldBeTestFlag() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertEqual(_manager.get_flag(_test_flag.name), _test_flag, "Expected manager.get_flag() to be test_flag.");
}

function test_animationManagerGetFlag_withNonExistingFlag_shouldBeUndefined() {
    var _manager = parent.manager;
    assertIsUndefined(_manager.get_flag("flag not added"), "Expected manager.get_flag() to return undefined.");
}


/**
 * Testing AnimationManager get_flag_position
 */
function test_animationManagerGetFlagPosition_withNonExistingFlag_shouldBeUndefined() {
    var _manager = parent.manager;
    assertIsUndefined(_manager.get_flag_position("flag not added"), "Expected manager.get_flag_position() to be undefined.");
}

function test_animationManagerGetFlagPosition_withFlagAdd_shouldBe0() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertEqual(_manager.get_flag_position(_test_flag.name), 0, "Expected manager.get_flag_position() to be 0.");
}

function test_animationManagerGetFlagPosition_withFlagRemove_shouldBeUndefined() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    _manager.remove_flag(_test_flag.name);
    assertIsUndefined(_manager.get_flag_position(_test_flag.name), "Expected manager.get_flag_position() to be undefined.");
}


/**
 * Testing AnimationManager get_flag_position
 */
function test_animationManagerGetFlagPosition_withNoFlagAdded_shouldBeUndefined() {
    var _manager = parent.manager;
    assertIsUndefined(_manager.get_flag_at_position(0), "Expected manager.get_flag_at_position(0) to be undefined.");
}

function test_animationManagerGetFlagPosition_withPositionBelowRange_shouldBeUndefined() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertIsUndefined(_manager.get_flag_at_position(-1), "Expected manager.get_flag_at_position(-1) to be undefined.");
}

function test_animationManagerGetFlagPosition_withPositionAboveRange_shouldBeUndefined() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertIsUndefined(_manager.get_flag_at_position(1), "Expected manager.get_flag_at_position(1) to be undefined.");
}

function test_animationManagerGetFlagPosition_withAddFlag_shouldBeTestFlag() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    assertEqual(_manager.get_flag_at_position(0), _test_flag, "Expected manager.get_flag_at_position(0) to be test_flag.");
}


/**
 * Testing AnimationManager get_active_flag
 */
function test_animationManagerGetActiveFlag_withSetFlagNotExistingFlag_shouldBeUndefined() {
    var _manager = parent.manager;
    _manager.set_flag("flag not added");
    assertIsUndefined(_manager.get_active_flag(), "Expected manager.get_active_flag() to be undefined.");
}

function test_animationManagerGetActiveFlag_withSetFlag_shouldBeTestFlag() {
    var _manager = parent.manager;
    var _test_flag = parent.test_flag;
    _manager.add_flag(_test_flag);
    _manager.set_flag(_test_flag.name);
    assertEqual(_manager.get_active_flag(), _test_flag, "Expected get_active_flag() to be \"test flag\".");
}

/**
 * Testing AnimationManager get_sprite_name
 */
function test_animationManagerGetSpriteName_withSpriteIndexPassed_shouldBeSpriteName() {
    var _manager = parent.manager;
    assertEqual(_manager.get_sprite_name(), "spr_pixel_platformer_player", "Expected manager.get_sprite_name() to be \"spr_pixel_platformer_player\".");
}

function test_animationManagerGetSpriteName_withNoonePassed_shouldBeNoone() {
    var _manager = new AnimationManager("test manager no sprite", noone);
    assertIsNoone(_manager.get_sprite_name(), "Expected manager.get_sprite_name() to be noone.");
}
