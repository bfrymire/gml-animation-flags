// Run AnimationManager
animation_manager.run();

// Check for inputs
var _up = keyboard_check_pressed(vk_up) || mouse_wheel_up();
var _down = keyboard_check_pressed(vk_down) || mouse_wheel_down();
var _dir = _down - _up;

// Change the active flag based on key pressed
if _dir != 0 {
    var _flag_position = animation_manager.get_flag_position(animation_manager.active_flag);
    _flag_position += _dir;
    if _flag_position < 0 {
        _flag_position = animation_manager.get_flags_number() - 1;
    } else if _flag_position > animation_manager.get_flags_number() - 1 {
        _flag_position = 0;
    }
    flag_picker_box.offset_want = _flag_position * string_height("M");
    animation_manager.set_flag(animation_manager.get_flag_at_position(_flag_position).name);
}

// Lerp position of flag names
var _box = flag_picker_box;
_box.offset = lerp(_box.offset, _box.offset_want, 0.15);
