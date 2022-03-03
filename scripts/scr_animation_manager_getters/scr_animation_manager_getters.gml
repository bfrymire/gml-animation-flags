// get_flags_number
function test_animation_manager_get_flags_number_added_flag() {
    parent.manager.flags[? "test flag"] = new AnimationFlag("test flag", 0, 1, 1);
    assertEqual(parent.manager.get_flags_number(), 1, "Expected manager.get_flags_number() to be 1.");
    parent.manager.flags = ds_map_create();
}

function test_animation_manager_get_flags_number_none_added() {
    assertEqual(parent.manager.get_flags_number(), 0, "Expected manager.get_flags_number() to be 0.");
}

// get_flag
function test_animation_manager_get_flag_existing() {
    parent.manager.flags[? "flag existing"] = new AnimationFlag("flag existing", 0, 1, 1);
    assertEqual(parent.manager.get_flag("flag existing"), parent.manager.flags[? "flag existing"], "Expected manager.get_flag() to be \"flag existing\" AnimationFlag.");
    parent.manager.flags = ds_map_create();
}

function test_animation_manager_get_flag_non_existing() {
    assertIsUndefined(parent.manager.get_flag("flag non-existing"), "Expected manager.get_flag() to return undefined.");
}

// get_flag_position
function test_animation_manager_get_flag_position_existing() {
    parent.manager.flags[? "flag existing"] = new AnimationFlag("flag existing", 0, 1, 1);
    parent.manager.__flags_order__[0] = "flag existing";
    assertEqual(parent.manager.get_flag_position("flag existing"), 0, "Expected manager.get_flag_position(\"flag_existing\") to be 0.");
    parent.manager.flags = ds_map_create();
    parent.manager.__flags_order__ = [];
}

function test_animation_manager_get_flag_position_non_existing() {
    assertIsUndefined(parent.manager.get_flag("flag non-existing"), "Expected manager.get_flag() to be undefined.");
}

// get_flag_at_position
function test_animation_manager_get_flag_at_position_existing() {
    parent.manager.flags[? "flag existing"] = new AnimationFlag("flag existing", 0, 1, 1);
    parent.manager.__flags_order__[0] = "flag existing";
    assertEqual(parent.manager.get_flag_at_position(0), parent.manager.flags[? "flag existing"], "Expected manager.get_flag_at_position(0) to be AnimationFlag \"flag existing\".");
    parent.manager.flags = ds_map_create();
}

function test_animation_manager_get_flag_at_position_non_existing() {
    assertIsUndefined(parent.manager.get_flag_at_position(0), "Expected manager.get_flag_at_position() to be undefined.");
}

// get_active_flag
function test_animation_manager_get_active_flag_existing() {
    parent.manager.flags[? "flag existing"] = new AnimationFlag("flag existing", 0, 1, 1);
    parent.manager.active_flag = "flag existing";
    assertEqual(parent.manager.get_active_flag(), parent.manager.flags[? "flag existing"], "Expected manager.get_active_flag() to be AnimationFlag \"flag existing\".");
    parent.manager.active_flag = undefined;
    parent.manager.flags = ds_map_create();
}

function test_animation_manager_get_active_flag_name_non_existing() {
    parent.manager.active_flag = "flag non-existing";
    assertIsUndefined(parent.manager.get_active_flag(), "Expected manager.get_active_flag() to be undefined.");
    parent.manager.active_flag = undefined;
}

// get_sprite_name
function test_animation_manager_get_sprite_name_existing() {
    assertEqual(parent.manager.get_sprite_name(), "spr_pixel_platformer_player", "Expected manager.get_sprite_name() to be \"spr_pixel_platformer_player\"");
}

function test_animation_manager_get_sprite_name_non_existing() {
    parent.manager.sprite = noone;
    assertIsUndefined(parent.manager.get_sprite_name(), "Expected manager.get_sprite_name() to be undefined.");
    parent.manager.sprite = spr_pixel_platformer_player;
}
