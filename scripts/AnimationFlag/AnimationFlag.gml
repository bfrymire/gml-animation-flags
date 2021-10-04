/**
 * Light weight object that marks beginning and end of animation
 * @constructor AnimationFlag
 * @param {string} name - Name of AnimationFlag
 * @param {real} start - Subimage index where the animation starts
 * @param {real} stop - Subimage index where the animation stops
 * @param {real} speed - Speed animation plays at, can also be negative
 */
function AnimationFlag(_name, _start, _stop, _speed) constructor {
    name = _name;
    start = _start;
    stop = _stop
    speed = _speed;
    index = start;
    parent = undefined;

    /**
     * Returns the difference between the stop and start indexes plus 1
     * @function get_flag_diff
     * @returns {real} Difference between start and stop indexes plus 1
     */
    get_flag_diff = function() {
        return (stop - start) + 1;
    }

    /**
     * Gets the index of the flag
     * @function get
     * @returns {real} Index of flag
     */
    get = function() {
        return index;
    }

    /**
     * Resets index to start and returns self
     * @function reset
     * @returns {struct} self
     */
    reset = function() {
        index = start;
        return self;
    }

    /**
     * Runs flag making changes to the index and returns self
     * @function run
     * @returns {struct} self
     */
    run = function() {
        index += speed;
        index = __modulo__(index - start, get_flag_diff()) + start;
        return self;
    }

    /**
     * Modulo function that returns the remainder of a division between number1 and number2
     * @function __modulo__
     * @param {real} number1
     * @param {real} number2
     * @returns {real} Remainder of a division between number1 and number2
     */
    __modulo__ = function(_num1, _num2) {
        var _mod = _num1 % _num2;
        if (_mod < 0) _mod += abs(_num2);
        return _mod;
    }

}
