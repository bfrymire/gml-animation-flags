/**
 * Light weight object that manages multiple animations on a single sprite
 * @constructor AnimationManager
 * @param {string} name - Name of AnimationManager
 * @param {real} sprite - Sprite index of animation sprite
 * @param [boolean=ANIMATION_FLAGS_DELTA_TIME] use_delta_time - Whether child flags use delta time
 */
function AnimationManager(_name, _sprite, _use_delta_time=ANIMATION_FLAGS_DELTA_TIME) constructor {
    name = _name;
    sprite = _sprite;
    use_delta_time = _use_delta_time;
    flags = {};
    __flags_order__ = [];
    active_flag = undefined;
    state = ANIMATION_MANAGER_STATES.RUN;

    /**
     * Adds a flag
     * @function add_flag
     * @param {struct} flag - AnimationFlag to add to flags
     * @param [boolean=false] replace - Overwrites AnimationFlag with the same name if it exists in flags
     * @returns {struct} self
     */
    static add_flag = function(_flag, _replace=false) {
        if flag_exists(_flag.name) && !_replace {
            debug_msg("flag with name " + _flag.name + " already exists.");
            return self;
        }
        flags[$ _flag.name] = _flag;
        array_push(__flags_order__, _flag.name);
        _flag.parent = self;
        return self;
    }

    /**
     * Removes flag by name
     * @function remove_flag
     * @param {string} name - Name of AnimationFlag to remove from flags
     * @returns {struct} self
     */
    static remove_flag = function(_name) {
        if !flag_exists(_name) {
            debug_msg("flag with name \"" + _name + "\" does not exist.");
            return self;
        }
        flags[$ _name].parent = undefined;
        var _flags_number = get_flags_number();
        // Remove flag name from flags order
        var i = 0;
        repeat (_flags_number) {
            if __flags_order__[i] == _name {
                array_delete(__flags_order__, i, 1);
                break;
            }
            i++;
        }
        recreate_flags_from_flags_order();
        return self;
    }

    /**
     * Creates a new flags struct based on names in flags order
     * @function recreate_flags_from_flags_order
     * @returns {struct} self
     */
    static recreate_flags_from_flags_order = function() {
        var _destination = {};
        var _len = array_length(__flags_order__);
        var i = 0;
        repeat (_len) {
            var _name = __flags_order__[i];
            _destination[$ _name] = flags[$ _name];
            i++;
        }
        flags = _destination;
        return self;
    }

    /**
     * Sets active flag by name
     * @function set_flag
     * @param {string} name - Name of AnimationFlag to set as active flag
     * @param [boolean=true] reset - AnimationFlag to reset its index to start
     * @returns {struct} self
     */
    static set_flag = function(_name, _reset=true) {
        if !flag_exists(_name) {
            debug_msg("flag with name \"" + _name + "\" does not exist.");
            return self;
        }
        active_flag = _name;
        if _reset {
            get_active_flag().reset();
        }
        return self;
    }

    /**
     * Returns a flag based on name passed
     * @function get_flag
     * @param {string} name - Name of AnimationFlag
     * @returns {struct|undefined} AnimationFlag that represents the name if it exists
     */
    static get_flag = function(_name) {
        if !is_string(_name) {
            debug_msg("get_flag() expects a string, received " + typeof(_name) + ".");
            return undefined;
        }
        if !flag_exists(_name) {
            debug_msg("flag with name \"" + string(_name) + "\" does not exist.");
            return undefined;
        }
        return flags[$ _name];
    }

    /**
     * Returns a number of flags
     * @function get_flags_number
     * @returns {real} Number of flags
     */
    static get_flags_number = function() {
        return variable_struct_names_count(flags);
    }

    /**
     * Returns position of flag based on order
     * @function get_flag_position
     * @param {string} name - Name of AnimationFlag
     * @returns {real} Position of flag based on order
     */
    static get_flag_position = function(_name) {
        if !flag_exists(_name) {
            return undefined;
        }
        var _flags_number = get_flags_number();
        var i = 0;
        repeat (_flags_number) {
            if __flags_order__[i] == _name {
                return i;
            }
            i++;
        }
        return undefined;
    }

    /**
     * Returns AnimationFlag struct that is at given position
     * @function get_flag_position
     * @param {real} position - Position of flag
     * @returns {struct|undefined} AnimationFlag struct that is at given position if applicable
     * @NOTE: Positions are base-0
     */
    static get_flag_at_position = function(_position) {
        var _flags_number = get_flags_number();
        if _flags_number == 0 || _position != clamp(_position, 0, _flags_number - 1) {
            return undefined;
        }
        return get_flag(__flags_order__[_position]);
    }

    /**
     * Returns AnimationFlag struct that represents the active flag
     * @function get_active_flag
     * @returns {struct|undefined} AnimationFlag struct that represents the active flag if it exists
     */
    static get_active_flag = function() {
        return get_flag(active_flag);
    }

    /**
     * Checks whether a flag exists
     * @function flag_exists
     * @param {string} name - Name of AnimationFlag to check in flags
     */
    static flag_exists = function(_name) {
        return variable_struct_exists(flags, _name);
    }

    /**
     * Returns the name of sprite animation
     * @function get_sprite_name
     * @returns {string} Name of sprite
     */
    static get_sprite_name = function() {
        if !sprite_exists(sprite) {
            return noone;
        }
        return sprite_get_name(sprite);
    }

    /**
     * Sets whether flags added to manager should use delta time for calculations
     * @function set_delta_time
     * @param {boolean} use_delta_time - Whether child flags use delta time
     * @returns {struct} self
     */
    static set_delta_time = function(_use_delta_time) {
        if !is_bool(_use_delta_time) {
            throw("AnimationFlag.set_delta_time() argument 0 expected a boolean, received " + typeof(_use_delta_time) + ".");
        }
        use_delta_time = _use_delta_time;
        return self;
    }

    /**
     * Debug message that prepends manager name and prints in output
     * @function debug_msg
     * @param {*} msg - Debug message to print in output
     */
    static debug_msg = function(_msg) {
        show_debug_message(repr() + " - " + string(_msg));
    }

    /**
     * Runs the active flag and returns self
     * @function run
     * @returns {struct} self
     */
    static run = function() {
        if is_undefined(active_flag) || state == ANIMATION_MANAGER_STATES.STOP {
            return self;
        }
        if !flag_exists(active_flag) {
            throw("AnimationManager.run() flag with name \"" + active_flag.name + "\" does not exist.");
            return self;
        }
        get_active_flag().run();
        return self;
    }

    /**
     * Returns printable representation of AnimationManager
     * @function repr
     * @returns {string} Printable representation of AnimationManager
     */
    static repr = function() {
        return "<AnimationManager - " + name + ">";
    }
}
