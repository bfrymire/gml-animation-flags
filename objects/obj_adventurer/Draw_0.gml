var _flag = animation_manager.get_flag(animation_manager.active_flag);

var _debug_text ="";
_debug_text += "active flag: " + animation_manager.active_flag + "\n";
_debug_text += "flag speed: " + string(_flag.speed) + "\n";
_debug_text += "flag index: " + string(_flag.get()) + "\n";
_debug_text += "flag index floor: " + string(floor(_flag.get())) + "\n";


draw_text(10, 10, _debug_text);
draw_sprite_ext(animation_manager.sprite, _flag.get(), room_width / 2, room_height / 2, 3, 3, 0, c_white, 1);
var _padding = 30;
var _w = room_width - _padding * 2;
var _len = sprite_get_number(animation_manager.sprite);
var _y = room_height / 2 + 150;
for(var i = 0; i < _len; i++) {
	var _outlined = floor(animation_manager.get_active_flag().get()) == i ? false : true;
	draw_circle(30 + ((_w / _len) * i), _y, 6, _outlined);
}
