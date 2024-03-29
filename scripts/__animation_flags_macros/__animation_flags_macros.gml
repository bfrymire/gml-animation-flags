#macro ANIMATION_FLAGS_URL "https://github.com/bfrymire/gml-animation-flags"
#macro ANIMATION_FLAGS_NAME "Animation Flags"
#macro ANIMATION_FLAGS_AUTHOR "Brent Frymire"
#macro ANIMATION_FLAGS_AUTHOR_HANDLE "bfrymire"
#macro ANIMATION_FLAGS_VERSION "1.4.1"
#macro ANIMATION_FLAGS_DATE "2022-10-30" // Year-Month-Day

#macro ANIMATION_FLAGS_DELTA_TIME false
#macro ANIMATION_FLAGS_DELTA_TIME_MS 0.000001
#macro ANIMATION_FLAGS_TARGET_FPS game_get_speed(gamespeed_fps)


show_debug_message("Using " + ANIMATION_FLAGS_NAME + " framework by " + ANIMATION_FLAGS_AUTHOR + ". This is version " + ANIMATION_FLAGS_VERSION + ", released on " + ANIMATION_FLAGS_DATE + ".");
