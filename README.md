# GML Animation Manager

Animation Manager is a light weight object that manages multiple animations for a single sprite for GameMaker Studio 2.3.3+

## Installation

 1. Upgrade GameMaker Studio 2 to version 2.3.3 or above
 2. [Download the .yymps file](https://github.com/bfrymire/gml-animation-manager/releases/latest)
 3. Import the .yymps file into your project from the top menu:
	- Tools **>** Import Local Package

## Constructors and Methods

### `AnimationManager(name, sprite)`

**Constructor**

|Name|Datatype|Purpose|
|--|--|--|
|`name`|string|Name of `AnimationManager`|
|`sprite`|sprite_index|Sprite to use for animations|

Constructor that manages multiple animations on a single sprite through the use of `flags`. It's best to initialize the `AnimationManager` in the Create Event of the object that will be drawing the sprite.

`flags` is a [DS Map](https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Data_Structures/DS_Maps/DS_Maps.htm) that contains all of the animations specified as `AnimationFlag`.

**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
```

&nbsp;

### `.add_flag(flag, [replace=false])`

**Returns:** N/A (`undefined`)

|Name|Datatype|Purpose|
|--|--|--|
|`flag`|struct|Flag to add to `flags`|
|`[replace]`|boolean|Overwrites `AnimationFlag` with the same name if it exists in `flags`|


**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
// add flag for "attack_1" animation
animation_manager.add_flag(new AnimationFlag("attack_1", 0, 4, 0.15));
```

&nbsp;

### `.remove_flag(name)`

**Returns:** N/A (`undefined`)

|Name|Datatype|Purpose|
|--|--|--|
|`name`|string|Name of `AnimationFlag` to remove from `flags`|

Finds the `AnimationFlag` from `flags` by `name` and deletes it. If the flag is not found, it will send a debug message.

**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
// add flag for "attack_1" animation
animation_manager.add_flag(new AnimationFlag("attack_1", 0, 4, 0.15));
// remove flag for "attack_1" animation
animation_manager.remove_flag("attack_1");
```

&nbsp;

### `.set_flag(name, [reset=true])`

**Returns:** Struct, self

|Name|Datatype|Purpose|
|--|--|--|
|`name`|string|Name of `AnimationFlag` to set as active flag|
|`[reset]`|boolean|`AnimationFlag` to reset its `index` to `start`|

Returns the `AnimationFlag` from `flags`. If the flag is not found, it will send a debug message and return `undefined`.

**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
// add flag for "attack_1" animation
animation_manager.add_flag(new AnimationFlag("attack_1", 0, 4, 0.15));
// sets active flag to "attack_1"
animation_manager.set_flag("attack_1");
// get the active flag and store it in a variable
var active_flag = animation_manager.get_active_flag();
```

&nbsp;

### `.get_flag(name)`

**Returns:** Struct, that represents the name of the flag passed, N/A (`undefined`) if not found

|Name|Datatype|Purpose|
|--|--|--|
|`name`|string|Name of `AnimationFlag`|

Finds the `AnimationFlag` from `flags` by `name` and returns it. If the flag is not found, it will send a debug message and return `undefined`.

**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
// add flag for "attack_1" animation
animation_manager.add_flag(new AnimationFlag("attack_1", 0, 4, 0.15));
// get flag for "attack_1" animation and store it in a variable
var attack_1_flag = animation_manager.get_flag("attack_1");
```

&nbsp;

### `.get_active_flag()`

**Returns:** Struct, that represents the `active_flag`, N/A (`undefined`) if not found

|Name|Datatype|Purpose|
|--|--|--|
|None|||

Returns the `AnimationFlag` from `flags` that represents the `active_flag`. If the flag is not found, it will send a debug message and return `undefined`.

**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
// add flag for "attack_1" animation
animation_manager.add_flag(new AnimationFlag("attack_1", 0, 4, 0.15));
// sets active flag to "attack_1"
animation_manager.set_flag("attack_1");
// get the active flag and store it in a variable
var active_flag = animation_manager.get_active_flag();
```

&nbsp;

### `.flag_exists(name)`

**Returns:** Boolean, whether the name of flag exists in `flags`

|Name|Datatype|Purpose|
|--|--|--|
|`name`|string|Name of `AnimationFlag` to check in `flags`|

Checks whether a flag exists with the specified `name` and returns the result.

**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
// add flag for "attack_1" animation
animation_manager.add_flag(new AnimationFlag("attack_1", 0, 4, 0.15));
// check if "attack_1" flag exists
var has_atk_1_anim = animation_manager.flag_exists("attack_1");
```

&nbsp;

### `.get_sprite_name()`

**Returns:** String, name of `sprite_index` at `sprite`

|Name|Datatype|Purpose|
|--|--|--|
|None|||

Returns the name of the `sprite_index` stored in `sprite`.

**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
// get sprite name and store it in a variable
var sprite_name = animation_manager.get_sprite_name();
```


&nbsp;

### `.destroy()`

**Returns:** N/A (`undefined`)

|Name|Datatype|Purpose|
|--|--|--|
|None|||

Cleans up all data structures when you no longer need the manager by destroying them. This function should be added to the Clean Up Event of the object to prevent memory leaks.

&nbsp;

### `.debug_msg(msg)`

**Returns:** N/A (`undefined`)

|Name|Datatype|Purpose|
|--|--|--|
|`msg`|string|Debug message to print in output|

Method used by the library to display information about the `AnimationManager` and the error message in the Output Window. This method is strictly for debugging.

&nbsp;

### `.run()`

**Returns:** N/A (`undefined`)

|Name|Datatype|Purpose|
|--|--|--|
|None|||

Runs the flag associated with `active_flag` and returns `self`. If `active_flag` is not set or not `AnimationFlag` exists that's associated with the name stored in `active_flag`.

----

### `AnimationFlag(name, start, stop, speed)`

**Constructor**

|Name|Datatype|Purpose|
|--|--|--|
|`name`|string|Name of `AnimationFlag`|
|`start`|real|Subimage index where the animation starts|
|`stop`|real|Subimage index where the animation stops|
|`speed`|real|Speed animation plays at, can also be negative|

Constructor that marks beginning and end positions of an animation within a sprite. `AnimationFlag` has its own speed set individually upon creation. Since Animation Manager only works with frame-capped games, you can calculate an `AnimationFlag`'s Frames Per Second *(FPS)* as follows:

```js
AnimationFlag.speed * room_speed
```

**Example:**

```js
// init animation manager
animation_manager = new AnimationManager("Adventurer", spr_adventurer);
// add flag for "attack_1" animation
animation_manager.add_flag(new AnimationFlag("attack_1", 0, 4, 0.15));
```

&nbsp;

### `.get_flag_diff()`

**Returns:** Real, difference between `start` and `stop` indexes plus 1

|Name|Datatype|Purpose|
|--|--|--|
|None|||

Returns the difference between the `stop` and `start` indexes plus 1. Adds 1 because although subimages are base-0, the index of a subimage spans the to the next integer.

&nbsp;

### `.get()`

**Returns:** Real, index of flag

|Name|Datatype|Purpose|
|--|--|--|
|None|||

Gets the index of the flag

&nbsp;

### `.reset()`

**Returns:** Struct, self

|Name|Datatype|Purpose|
|--|--|--|
|None|||

Sets `index` to `start` and returns `self`.

&nbsp;

### `.run()`

**Returns:** N/A (`undefined`)

|Name|Datatype|Purpose|
|--|--|--|
|None|||

Runs flag making changes using the `speed` to the `index`. This method doesn't need to be called manually, it is called by the `parent` `AnimationManager.run` when it is the `active_flag`. If the `index` goes past either `start` or `stop`, depending on the sign of `speed`, the remainder of `index` will be wrapped around the indexes until it falls between them.

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

 - Adventurer sprite in example created by [@rvros](https://rvros.itch.io/)
 - Color palette in example from [Dracula Theme](https://github.com/dracula/dracula-theme#color-palette)

## License

[MIT License](./LICENSE) &copy; Brent Frymire