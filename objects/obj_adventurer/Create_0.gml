// Set up new AnimationManager
animation_manager = new AnimationManager("Test Manager", spr_adventurer);
var _speed = 0.15;
animation_manager.add_flag(new AnimationFlag("attack_1", 0, 4, _speed));
animation_manager.add_flag(new AnimationFlag("attack_2", 5, 10, _speed));
animation_manager.add_flag(new AnimationFlag("attack_3", 11, 16, _speed));
animation_manager.add_flag(new AnimationFlag("corner_climb", 17, 21, _speed));
animation_manager.add_flag(new AnimationFlag("corner_grab", 22, 25, _speed));
animation_manager.add_flag(new AnimationFlag("corner_jump", 26, 28, _speed));
animation_manager.add_flag(new AnimationFlag("crouch", 29, 32, _speed));
animation_manager.add_flag(new AnimationFlag("die", 33, 39, _speed));
animation_manager.add_flag(new AnimationFlag("fall", 40, 41, _speed));
animation_manager.add_flag(new AnimationFlag("hurt", 42, 44, _speed));
animation_manager.add_flag(new AnimationFlag("idle_1", 45, 48, _speed));
animation_manager.add_flag(new AnimationFlag("idle_2", 49, 52, _speed));
animation_manager.add_flag(new AnimationFlag("jump", 53, 56, _speed));
animation_manager.add_flag(new AnimationFlag("run", 57, 62, _speed));
animation_manager.add_flag(new AnimationFlag("slide", 63, 64, _speed));
animation_manager.add_flag(new AnimationFlag("roll", 65, 68, _speed));
animation_manager.add_flag(new AnimationFlag("stand", 69, 71, _speed));

animation_manager.set_flag("attack_1");
