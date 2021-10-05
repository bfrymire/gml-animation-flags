// Set up new AnimationManager
animator = new AnimationManager("Player", spr_pixel_platformer_player);
var _image_speed = 0.15;

// Creating flags
animator.add_flag(new AnimationFlag("idle_still", 0, 0, _image_speed));
animator.add_flag(new AnimationFlag("idle", 1, 7, _image_speed));
animator.add_flag(new AnimationFlag("idle_transition", 8, 9, _image_speed));
animator.add_flag(new AnimationFlag("run", 10, 17, _image_speed));
animator.add_flag(new AnimationFlag("jump_rise", 18, 18, _image_speed));
animator.add_flag(new AnimationFlag("jump_mid", 19, 19, _image_speed));
animator.add_flag(new AnimationFlag("jump_fall", 20, 20, _image_speed));
animator.add_flag(new AnimationFlag("land", 21, 22, _image_speed));
animator.add_flag(new AnimationFlag("front_flip", 23, 36, _image_speed));
animator.add_flag(new AnimationFlag("crouch", 37, 42, _image_speed));
animator.add_flag(new AnimationFlag("crawl", 43, 50, _image_speed));
animator.add_flag(new AnimationFlag("roll", 51, 60, _image_speed));
animator.add_flag(new AnimationFlag("dash", 61, 64, _image_speed));
animator.add_flag(new AnimationFlag("slide", 65, 68, _image_speed));
animator.add_flag(new AnimationFlag("ledge_hand", 69, 69, _image_speed));
animator.add_flag(new AnimationFlag("ledge_climb", 70, 77, _image_speed));
animator.add_flag(new AnimationFlag("wall_slide", 78, 83, _image_speed));
animator.add_flag(new AnimationFlag("knockback", 84, 89, _image_speed));
animator.add_flag(new AnimationFlag("look_up", 90, 92, _image_speed));

// Sets animation
animator.set_flag("run");


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
