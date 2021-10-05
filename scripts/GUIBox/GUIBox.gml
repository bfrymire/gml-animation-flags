/**
 * Box constructing of top-left corner and bottom-right corner positions
 * @constructor
 * @param {real} x1 - x position of top-left corner
 * @param {real} y1 - y position of top-left corner
 * @param {real} x2 - x position of bottom-right corner
 * @param {real} y2 - y position of bottom-right corner
 * @param {real} [margin=0] - Margin on the inside of the box
 */
function GUIBox(_x1, _y1, _x2, _y2, _margin=0, _color=c_black) constructor {
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    margin = _margin;
    color = _color;

    /**
     * Returns width of box
     * @function get_width
     * @returns {real} Width of box
     */
    get_width = function() {
        return x2 - x1;
    }

    /**
     * Returns height of box
     * @function get_height
     * @returns {real} Height of box
     */
    get_height = function() {
        return y2 - y1;
    }

    /**
     * Returns inner width of box
     * @function get_inner_width
     * @returns {real} Inner width of box
     */
    get_inner_width = function() {
        return (x2 - x1) - (margin * 2);
    }

    /**
     * Returns inner height of box
     * @function get_inner_height
     * @returns {real} Inner height of box
     */
    get_inner_height = function() {
        return (y2 - y1) - (margin * 2);
    }

    /**
     * Returns the middle width point of box
     * @function get_width_mid_point
     * @returns {real} Middle width point of box
     */
    get_width_mid_point = function() {
        return x1 + get_width() / 2;
    }

    /**
     * Returns the middle height point of box
     * @function get_height_mid_point
     * @returns {real} Middle height point of box
     */
    get_height_mid_point = function() {
        return y1 + get_height() / 2;
    }

    /**
     * Sets draw color
     * @function set_color
     * @param {real} color - Color to set drawing to
     */
    set_color = function(_color) {
        color = _color;
    }

    /**
     * Default draw event for drawing a rectangle the size of GUIBox
     * @function __draw__
     */
    __draw__ = function() {
        draw_rectangle_color(x1, y1, x2, y2, color, color, color, color, true);
    }

    /**
     * Draws rectangle the size of GUIBox
     * @function draw
     */
    draw = function() {
        __draw__();
    }

    /**
     * Set drawing function
     * @function set_draw
     * @param {method} func - Method to overwrite draw() function with
     */
    set_draw = function(_func) {
        if !is_method(_func) {
            show_error("Expected method, recieved " + typeof(_func), true);
        }
        draw = method(self, _func);
    }
}
