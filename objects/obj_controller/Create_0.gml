// Set up new AnimationManager
animator = new AnimationManager("Adventurer", spr_adventurer);
var _spd_default = 0.15;
var _spd_slow = 0.05;

// Creating flags
animator.add_flag(new AnimationFlag("attack_1", 0, 4, _spd_default));
animator.add_flag(new AnimationFlag("attack_2", 5, 10, _spd_default));
animator.add_flag(new AnimationFlag("attack_3", 11, 16, _spd_default));
animator.add_flag(new AnimationFlag("corner_climb", 17, 21, _spd_default));
animator.add_flag(new AnimationFlag("corner_grab", 22, 25, _spd_slow));
animator.add_flag(new AnimationFlag("corner_jump", 26, 28, _spd_default));
animator.add_flag(new AnimationFlag("crouch", 29, 32, _spd_slow));
animator.add_flag(new AnimationFlag("die", 33, 39, 0.085));
animator.add_flag(new AnimationFlag("fall", 40, 41, _spd_default));
animator.add_flag(new AnimationFlag("hurt", 42, 44, _spd_default));
animator.add_flag(new AnimationFlag("idle_1", 45, 48, _spd_slow));
animator.add_flag(new AnimationFlag("idle_2", 49, 52, _spd_slow));
animator.add_flag(new AnimationFlag("jump", 53, 56, _spd_default));
animator.add_flag(new AnimationFlag("run", 57, 62, _spd_default));
animator.add_flag(new AnimationFlag("slide", 63, 64, _spd_default));
animator.add_flag(new AnimationFlag("roll", 65, 68, _spd_default));
animator.add_flag(new AnimationFlag("stand", 69, 71, _spd_default));

// Sets animation
animator.set_flag("attack_1");


// Setting up GUI
// Defining Dracula Theme colors
dracula_theme = {
	background: make_color_rgb(40, 42, 54),
	current_line: make_color_rgb(68, 71, 90),
	selection: make_color_rgb(68, 71, 90),
	foreground: make_color_rgb(248, 248, 242),
	comment: make_color_rgb(98, 114, 164),
	cyan: make_color_rgb(139, 233, 253),
	green: make_color_rgb(80, 250, 123),
	orange: make_color_rgb(255, 184, 108),
	pink: make_color_rgb(255, 121, 198),
	purple: make_color_rgb(189, 147, 249),
	red: make_color_rgb(255, 85, 85),
	yellow: make_color_rgb(241, 250, 140),
}
colors = dracula_theme;

// Styling
var _margin = 10;
padding = 10;
radius = 6;

// Flag index box
flag_index_box = new GUIBox(1, room_height - 2, room_width - 2, room_height - 2, _margin);
sprite_number = sprite_get_number(animator.sprite);
var _rows = floor((((radius * 2) + padding) * sprite_number) / flag_index_box.get_inner_width());
flag_index_box.y1 -= radius * 2 * (_rows + 1) + padding * 2 * _rows;

// Adventurer sprite box
adventurer_sprite_box = new GUIBox(flag_index_box.x1, 1, floor(room_width / 2) - 2, flag_index_box.y1 - 3, _margin);

// Flag picker box
flag_picker_box = new GUIBox(adventurer_sprite_box.x2 + 3, adventurer_sprite_box.y1, flag_index_box.x2, adventurer_sprite_box.y2, _margin);
var _box = flag_picker_box;
_box.title = {
	text: "Change the active flag using the arrow keys or mouse wheel:",
	width: _box.get_inner_width(),
};
_box.title.height = string_height_ext(_box.title.text, -1, _box.get_inner_width());
_box.offset_want = 0;
_box.offset = 0;

// Overwrite GUIBox draw function
var _draw = function() {
	var _c = draw_get_color();
	draw_set_color(other.colors.background);
	draw_rectangle(x1, y1, x2, y2, false);
	draw_set_color(other.colors.foreground);
	draw_rectangle(x1, y1, x2, y2, true);
	draw_set_color(_c);
}
flag_index_box.set_draw(_draw);
adventurer_sprite_box.set_draw(_draw);
flag_picker_box.set_draw(_draw);
