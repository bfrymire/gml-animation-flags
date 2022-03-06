var _flag = animator.get_active_flag();

// Drawing flag index pips
var _box = flag_index_box;
_box.draw();
draw_set_color(colors.foreground);
var _x_start = _box.x1 + _box.margin + radius;
var _x = _x_start;
var _y = _box.y1 + _box.margin + radius;
var i = 0;
repeat(sprite_number) {
    if i == clamp(i, _flag.start, _flag.stop) {
        // Draw outline box if i is within flag range
        var _x1 = _x - _box.margin;
        var _y1 = _y - _box.margin;
        var _x2 = _x + _box.margin + 1;
        var _y2 = _y + _box.margin + 1;
        draw_set_color(colors.selection);
        draw_rectangle(_x1, _y1, _x2, _y2, false);

        // Draw pip
        var _active_frame = floor(animator.get_active_flag().get()) == i ? true : false;
        if _active_frame {
            draw_set_color(colors.foreground);
            draw_circle(_x, _y, radius, false);
        } else {
            draw_set_color(colors.background);
            draw_circle(_x, _y, radius, false);
            draw_set_color(colors.foreground);
            draw_circle(_x, _y, radius, true);
        }
    } else {
        // Draw pip
        draw_set_color(colors.foreground);
        draw_circle(_x, _y, radius, true);
    }

    // Update pip position
    _x += radius * 2 + _box.margin;
	if _x >= _box.x2 - _box.margin - radius {
		_x = _x_start;
		_y += radius * 2 + _box.margin;
	}

    i++;
}

// Draw player sprite GUIBox
var _box = player_sprite_box;
_box.draw();
var _scale = min(_box.get_inner_width(), _box.get_inner_height()) / max(sprite_get_width(animator.sprite), sprite_get_height(animator.sprite));
draw_sprite_ext(animator.sprite, animator.get_active_flag().get(), _box.get_width_mid_point(), _box.y2 - _box.margin, _scale, _scale, 0, c_white, 1);
var _details = ANIMATION_FLAGS_NAME + " v." + ANIMATION_FLAGS_VERSION + " " + ANIMATION_FLAGS_DATE + "\n";
_details += animator.get_active_flag().repr();
draw_text(_box.x1 + _box.margin, _box.y1 + _box.margin, _details);

// Draw flag picker GUIBox
var _box = flag_picker_box;
_box.draw();

// Drawing title text
draw_set_color(colors.foreground);
draw_text_ext(_box.x1 + _box.margin, _box.y1 + _box.margin, _box.title.text, -1, _box.title.width);

// Drawing flag picker flags
var _h = string_height("M");
var _len = animator.get_flags_number();
draw_set_halign(fa_middle);
for(var i = 0; i < _len; i++) {
    var _y = _box.get_height_mid_point() - _box.offset + _h * i;

    // Continue of y value is not within box bounds
    if _y < _box.y1 + _box.margin * 2 + _box.title.height || _y + _h > _box.y2 - _box.margin {
        continue;
    }

    // Highlight name if it's the active flag name
    var _name = animator.__flags_order__[i];
    if animator.active_flag == _name {
        draw_set_color(colors.yellow);
        _name = ">  " + _name + "  <"
    } else {
        draw_set_color(colors.comment);
    }
    draw_text(_box.get_width_mid_point(), _y, _name);
}
draw_set_halign(fa_left);
