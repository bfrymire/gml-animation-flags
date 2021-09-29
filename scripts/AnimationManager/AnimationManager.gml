/**
 * Light weight object that manages multiple animations on a single sprite
 * 
 * @constructor AnimationManager
 * @param name - Name of AnimationManager
 * @param sprite - Sprite index of animation
 */
function AnimationManager(_name, _sprite) constructor {
    name = _name;
    sprite = _sprite
    flags = ds_map_create();
    active_flag = undefined;
    state = ANIMATION_FLAG_STATES.RUN;

    /**
     * Adds a flag
     * 
     * @function add_flag
     * @param flag - AnimationFlag to add to flags
     * @param replace - Overwrite AnimationFlag with the same name if it exists in flags
     */
    add_flag = function(_flag, _replace=false) {
        if !_replace && flag_exists(flags, _flag.name) {
            debug_msg("flag with name " + _flag.name + " already exists.");
            return;
        }
        flags[? _flag.name] = _flag;
        _flag.parent = self;
    }

    /**
     * Removes flag
     * 
     * @function remove_flag
     * @param name - Name of AnimationFlag to remove from flags
     */
    remove_flag = function(_name) {
        if !flag_exists(_name) {
            debug_msg("flag with name " + _name + " does not exist.");
            return;
        }
        flags[? _name].parent = undefined;
        ds_map_delete(flags, _name);
    }

    /**
     * Gets a flag
     * 
     * @function get_flag
     * @param name - Gets AnimationFlag by name from flags
     * @returns AnimationFlag
     */
    get_flag = function(_name) {
        if !flag_exists(_name) {
            debug_msg("flag with name " + _name + " does not exists.");
            return;
        }
        return flags[? _name];
    }

    /**
     * Get the active flag
     * 
     * @function get_active_flag
     * @param name - Gets the active AnimationFlag
     * @returns AnimationFlag
     */
    get_active_flag = function() {
        if !flag_exists(active_flag) {
            debug_msg("flag with name " + string(active_flag) + " does not exists.");
            return;
        }
        return flags[? active_flag];
    }

    /**
     * Sets active flag to name
     * 
     * @function set_flag
     * @param name - AnimationFlag to set as active flag
     * @param reset_index - AnimationFlag to reset its index to start index
     */
    set_flag = function(_name, _reset_index=true) {
        if !flag_exists(_name) {
            debug_msg("flag with name " + _name + " does not exist.");
            return;
        }
        active_flag = _name;
        if _reset_index {
            get_flag(active_flag).reset();
        }
    }

    /**
     * Checks whether a flag exists
     * 
     * @function flag_exists
     * @param name - Name of AnimationFlag to check in flags
     */
    flag_exists = function(_name) {
        return ds_map_exists(flags, _name);
    }

    /**
     * Gets the name of sprite animation
     * 
     * @function get_sprite_name
     * @returns sprite_name
     */
    get_sprite_name = function() {
        return sprite_get_name(sprite);
    }

    /**
     * Cleans up data structures when you no longer need the manager
     * 
     * @function destroy
     * @note Run this on a Clean Up Event to prevent data leaks
     */
    destroy = function() {
        ds_map_destroy(flags);
    }

    /**
     * Debug message that prepends manager name and prints in output
     * 
     * @function debug_msg
     * @param msg - Debug message to print in output
     */
    debug_msg = function(_msg) {
        show_debug_message("<AnimationManager - " + name + "> - " + string(_msg));
    }

    /**
     * Runs current flag
     * 
     * @function run
     */
    run = function() {
        if is_undefined(active_flag) || state == ANIMATION_FLAG_STATES.STOP {
            return;
        }
        if !flag_exists(active_flag) {
            debug_msg("flag with name " + active_flag.name + " does not exist.");
            return;
        }
        flags[? active_flag].run();
    }
}
