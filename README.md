# GML Animation Flags

Animation Flags handles multiple animations for a single sprite by flagging start and end points of the animations for GameMaker Studio 2.3.3+

## Installation

 1. Upgrade GameMaker Studio 2 to version 2.3.3 or above
 2. [Download the .yymps file](https://github.com/bfrymire/gml-animation-flags/releases/latest)
 3. Import the .yymps file into your project from the top menu:
	- Tools **>** Import Local Package

## Setup

```js
// create animation manager
animator = new AnimationManager("Adventurer", spr_adventurer);
// add animation flag to manager
animator.add_flag(new AnimationFlag("attack_1", 0, 4, 0.15));
// set active flag
animator.set_flag("attack_1");
```

## Documentation

[Go to the Wiki](https://github.com/bfrymire/gml-animation-flags/wiki) to view the documentation.

## Limitations

- Does not tell you if the animation ends
	- *(Will create an event-based broadcaster for this later)*
- Does not work with delta time
- Need to manually edit `AnimationFlag` `start` and `stop` indexes if the frames for animations for `AnimationManager` are changed
- Does not work with versions of GameMaker Studio 2 before v.2.3.3 because of the default parameters
- No implementation to change `AnimationFlag.speed` on the fly
	- *(The `speed` variable can be edited directly by calling `AnimationFlag.speed`)*
- `AnimationFlag.speed` does not take Frame Information from the [Image Editor](https://manual.yoyogames.com/The_Asset_Editors/Image_Editor.htm) or the Frame Speed from the [Sprite Editor](https://manual.yoyogames.com/The_Asset_Editors/Sprites.htm) into consideration.
	- *(To change the speed of the sprite, it must be done on the `AnimationFlag` level individually per flag)*

## Credits

 - Sprite base in example created by [@Dead Revolver](https://deadrevolver.itch.io/pixel-prototype-player-sprites)
 - Color palette in example from [Dracula Theme](https://github.com/dracula/dracula-theme#color-palette)

## License

[MIT License](./LICENSE) &copy; Brent Frymire