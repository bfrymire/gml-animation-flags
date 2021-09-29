/**
 * Light weight object that marks beginning and end of animation
 * 
 * @constructor AnimationFlag
 * @param name - Name of AnimationFlag
 * @param start - Subimage index where the animation starts
 * @param length - Number of subimages in a row for the animation
 * @param speed - Speed animation plays at, can also be negative
 */
 //* @param stop - Subimage index where the animation stops
function AnimationFlag(_name, _start, _stop, _speed) constructor {
    name = _name;
    start = _start;
    stop = _stop
    speed = _speed;
    index = start;
    parent = undefined;

    /**
     * Runs flag
     * 
     * @function run
     */
    run = function() {
        index += speed;
        while (index >= stop + 1) {
            index -= get_flag_diff();
        }
        while (index < start) {
            index += get_flag_diff();
        }
        return self;
    }

    /**
     * Gets the difference between the stop and start indexes
     * 
     * @function get_flag_diff
     * @returns real
     */
    get_flag_diff = function() {
        return (stop - start) + 1;
    }

    /**
     * Gets the current index of the flag
     * 
     * @function get
     * @returns real
     */
    get = function() {
        return index;
    }

    /**
     * Resets index to start index
     * 
     * @function reset
     * @returns self
     */
    reset = function() {
        index = start;
        return self;
    }

}