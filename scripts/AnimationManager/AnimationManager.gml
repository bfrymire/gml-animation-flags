/**
 * Light weight object that manages multiple animations on a single sprite
 * @constructor AnimationManager
 * @param {string} name - Name of AnimationManager
 * @param {real} sprite - Sprite index of animation sprite
 */
function AnimationManager(_name, _sprite) constructor {
    name = _name;
    sprite = _sprite
    flags = ds_map_create();
    __flags_order__ = [];
    active_flag = undefined;
    state = ANIMATION_MANAGER_STATES.RUN;

    /**
     * Adds a flag
     * @function add_flag
     * @param {struct} flag - AnimationFlag to add to flags
     * @param {boolean} [replace=false] - Overwrites AnimationFlag with the same name if it exists in flags
     */
    add_flag = function(_flag, _replace=false) {
        if flag_exists(_flag.name) && !_replace {
            debug_msg("flag with name " + _flag.name + " already exists.");
            return;
        }
        flags[? _flag.name] = _flag;
        array_push(__flags_order__, _flag.name);
        _flag.parent = self;
    }

    /**
     * Removes flag by name
     * @function remove_flag
     * @param {string} name - Name of AnimationFlag to remove from flags
     */
    remove_flag = function(_name) {
        if !flag_exists(_name) {
            debug_msg("flag with name " + _name + " does not exist.");
            return;
        }
        flags[? _name].parent = undefined;
        ds_map_delete(flags, _name);
        var _len = get_flags_number();
        // Remove flag name from flags order
        for(var i = 0; i < _len; i++) {
            if __flags_order__[i] == _name {
                array_delete(__flags_order__, i, 1);
                break;
            }
        }
    }

    /**
     * Sets active flag to name
     * @function set_flag
     * @param {string} name - Name of AnimationFlag to set as active flag
     * @param {boolean} [reset=true] - AnimationFlag to reset its index to start
     * @returns {struct} self
     */
    set_flag = function(_name, _reset=true) {
        if flag_exists(_name) {
            active_flag = _name;
            if _reset {
                get_active_flag().reset();
            }
        } else {
            debug_msg("flag with name " + _name + " does not exists.");
        }
        return self;
    }

    /**
     * Returns a flag based on name passed
     * @function get_flag
     * @param {string} name - Name of AnimationFlag
     * @returns {struct|undefined} AnimationFlag that represents the name if it exists
     */
    get_flag = function(_name) {
        if !flag_exists(_name) {
            debug_msg("flag with name " + _name + " does not exists.");
            return undefined;
        }
        return flags[? _name];
    }

    /**
     * Returns a number of flags
     * @function get_flags_number
     * @returns {real} Number of flags
     */
    get_flags_number = function() {
        return ds_map_size(flags);
    }

    /**
     * Returns position of flag based on order
     * @function get_flag_position
     * @param {string} name - Name of AnimationFlag
     * @returns {real} Position of flag based on order
     */
    get_flag_position = function(_name) {
        if !flag_exists(_name) {
            return undefined;
        }
        var _len = get_flags_number();
        for(var i = 0; i < _len; i++) {
            if __flags_order__[i] == _name {
                return i;
            }
        }
    }

    /**
     * Returns AnimationFlag struct that is at given position
     * @function get_flag_position
     * @param {real} index - Position of flag
     * @returns {struct|undefined} AnimationFlag struct that is at given position
     * @note Positions are base-0
     */
    get_flag_at_position = function(_index) {
        var _len = get_flags_number();
        if _index != clamp(_index, 0, _len - 1) {
            return undefined;
        }
        return get_flag(__flags_order__[_index]);
    }

    /**
     * Returns AnimationFlag struct that represents the active flag
     * @function get_active_flag
     * @returns {struct|undefined} AnimationFlag struct that represents the active flag if it exists
     */
    get_active_flag = function() {
        return get_flag(active_flag);
    }

    /**
     * Checks whether a flag exists
     * @function flag_exists
     * @param {string} name - Name of AnimationFlag to check in flags
     */
    flag_exists = function(_name) {
        return ds_map_exists(flags, _name);
    }

    /**
     * Returns the name of sprite animation
     * @function get_sprite_name
     * @returns {string} Name of sprite
     */
    get_sprite_name = function() {
        return sprite_get_name(sprite);
    }

    /**
     * Cleans up data structures when you no longer need the manager
     * @function destroy
     * @note Run this in the Clean Up Event to prevent data leaks
     */
    destroy = function() {
        ds_map_destroy(flags);
    }

    /**
     * Debug message that prepends manager name and prints in output
     * @function debug_msg
     * @param msg - Debug message to print in output
     */
    debug_msg = function(_msg) {
        show_debug_message(repr() + " - " + string(_msg));
    }

    /**
     * Runs the active flag and returns self
     * @function run
     * @returns {struct} self
     */
    run = function() {
        if is_undefined(active_flag) || state == ANIMATION_MANAGER_STATES.STOP {
            return;
        }
        if !flag_exists(active_flag) {
            debug_msg("flag with name " + active_flag.name + " does not exist.");
            return;
        }
        flags[? active_flag].run();
        return self;
    }

    /**
     * Returns printable representation of AnimationManager
     * @function repr
     * @returns {string} Printable representation of AnimationManager
     */
    repr = function() {
        return "<AnimationManager - " + name + ">";
    }
}
