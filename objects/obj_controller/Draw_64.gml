var _flag = animation_manager.get_active_flag();

// Setting up text
var _debug_text ="";
_debug_text += "active flag: " + animation_manager.active_flag + "\n";
_debug_text += "flag speed: " + string(_flag.speed) + "\n";
_debug_text += "flag index: " + string(_flag.get()) + "\n";
_debug_text += "flag index floor: " + string(floor(_flag.get())) + "\n";

// Drawing text to screen
draw_text(10, 10, _debug_text);

// Drawing flag index pips
// var _margin = 2;
// var _w = room_width - padding * 2;
// var _len = sprite_get_number(animation_manager.sprite);
// var _x_start = padding + radius;
// var _x = _x_start;
// var _inc = radius * 2 + _margin;
// var _y = room_height / 2 + padding + radius;
// for(var i = 0; i < _len; i++) {
// 	var _outlined = floor(animation_manager.get_active_flag().get()) == i ? false : true;
// 	draw_circle(_x, _y, radius, _outlined);
// 	_x += _inc;
// 	if _x + _inc >= room_width - padding {
// 		_x = _x_start;
// 		_y += _inc;
// 	}
// }

// Drawing flag index pips
var _box = flag_index_box;
_box.draw();
draw_set_color(colors.foreground);
var _x_start = _box.x1 + _box.margin + radius;
var _x = _x_start;
var _y = _box.y1 + _box.margin + radius;
var i = 0;
repeat(sprite_number) {
    // draw pips
    var _outlined = floor(animation_manager.get_active_flag().get()) == i ? false : true;
    draw_circle(_x, _y, radius, _outlined);
    // Update pip position
    _x += radius * 2 + _box.margin;
	if _x >= _box.x2 - _box.margin - radius {
		_x = _x_start;
		_y += radius * 2 + _box.margin;
	}
    // Increment i variable
    i += 1;
}

// Draw adventurer sprite GUIBox
var _box = adventurer_sprite_box;
_box.draw();
// var _scale = (_y - _padding * 2) / sprite_get_height(animation_manager.sprite);
var _scale = min(_box.get_inner_width(), _box.get_inner_height()) / max(sprite_get_width(animation_manager.sprite), sprite_get_height(animation_manager.sprite));
draw_sprite_ext(animation_manager.sprite, animation_manager.get_active_flag().get(), _box.get_width_mid_point(), _box.y2 - _box.margin, _scale, _scale, 0, c_white, 1);

// Draw flag picker GUIBox
var _box = flag_picker_box;
_box.draw();
var _h = string_height("M");
var _len = ds_map_size(animation_manager.flags);
var _key = ds_map_find_first(animation_manager.flags);
// show_message(_active_flag);
draw_set_halign(fa_middle);
for(var i = 0; i < _len; i++) {
    // show_debug_message(string(_key) + " :: " + string(_active_flag));
	if _key == animation_manager.active_flag {
		draw_set_color(colors.yellow);
	} else {
		draw_set_color(colors.comment);
	}
	draw_text(_box.get_width_mid_point(), _box.y1 + _box.margin + _h * i, _key);
    _key = ds_map_find_next(animation_manager.flags, _key);
}
draw_set_halign(fa_left);
