//Defines for atom layers and planes
//KEEP THESE IN A NICE ACSCENDING ORDER, PLEASE

//NEVER HAVE ANYTHING BELOW THIS PLANE ADJUST IF YOU NEED MORE SPACE
#define LOWEST_EVER_PLANE -200

#define FIELD_OF_VISION_BLOCKER_PLANE -199
#define FIELD_OF_VISION_BLOCKER_RENDER_TARGET "*fovblock"

//---------- DEFILTER PLANES -------------
#define DEFILTER_REFLECTIVE_PLANE_ALL -102
#define DEFILTER_REFLECTIVE_PLANE_ALL_RENDER_TARGET "*DEFILTER_REFLECTIVE_PLANE_ALL_RENDER_TARGET"
#define DEFILTER_MANUAL_REFLECTIVE_PLANE -101
#define DEFILTER_MANUAL_REFLECTIVE_PLANE_RENDER_TARGET "*DEFILTER_MANUAL_REFLECTIVE_PLANE_RENDER_TARGET"
#define DEFILTER_MANUAL_REFLECTIVE_MASK_PLANE -100
#define DEFILTER_MANUAL_REFLECTIVE_PLANE_MASK_RENDER_TARGET "*DEFILTER_MANUAL_REFLECTIVE_PLANE_MASK_RENDER_TARGET"

#define CLICKCATCHER_PLANE -99

#define PLANE_SPACE -95
#define PLANE_SPACE_PARALLAX -90

#define SOUND_HINT_PLANE 510
#define INSPECTION_IMAGE_LAYER 0
#define SOUND_HINT_LAYER 1

#define WEATHER_OVERLAY_PLANE -80
#define WEATHER_OVERLAY_LAYER -80
#define WEATHER_RENDER_TARGET "*WEATHER_OVERLAY_PLANE"

//---------- REFLECTIONS -------------
#define MANUAL_REFLECTIVE_PLANE -88 //Plane for manual reflections, like moving mobs, so we don't get displacement issues
#define MANUAL_REFLECTIVE_PLANE_RENDER_TARGET "*MANUAL_REFLECTIVE_PLANE_RENDER_TARGET"
#define MANUAL_REFLECTIVE_MASK_PLANE -87 //Plane for masking manual stuff
#define MANUAL_REFLECTIVE_MASK_PLANE_RENDER_TARGET "*MANUAL_REFLECTIVE_MASK_PLANE_RENDER_TARGET"

#define REFLECTIVE_DISPLACEMENT_PLANE -86 //Plane for flipping reflected stuff
#define REFLECTIVE_DISPLACEMENT_PLANE_RENDER_TARGET "*REFLECTIVE_DISPLACEMENT_PLANE_RENDER_TARGET"

#define REFLECTIVE_PLANE -85 //Plane for reflective surfaces below the game plane
#define REFLECTIVE_PLANE_RENDER_TARGET "*REFLECTIVE_PLANE_RENDER_TARGET"
#define REFLECTIVE_PLANE_ABOVE -84 //Plane for reflections above the game plane
#define REFLECTIVE_PLANE_ABOVE_RENDER_TARGET "*REFLECTIVE_PLANE_ABOVE_RENDER_TARGET"

#define REFLECTIVE_ALL_PLANE -83
#define REFLECTIVE_ALL_PLANE_RENDER_TARGET "*REFLECTIVE_PLANE_ALL_RENDER_TARGET"
#define REFLECTIVE_ALL_ABOVE_PLANE -82
#define REFLECTIVE_ALL_ABOVE_PLANE_RENDER_TARGET "*REFLECTIVE_ALL_ABOVE_PLANE_RENDER_TARGET"

#define SHADOWCASTING_REFLECTOR_PLANE -50

#define SHADOWCASTING_PLANE 0

/atom/movable/screen/plane_master/shadowcasting
	name = "shadowcasting plane master"
	plane = SHADOWCASTING_PLANE
	render_target = "all3"
	appearance_flags = PLANE_MASTER

/atom/movable/screen/plane_master/shadowcasting/backdrop(mob/mymob)
	. = ..()
	add_filter("blur", 4, list("type" = "blur", size=2))

/atom/movable/screen/plane_master/shadowcasting/New()
	. = ..()
	add_filter("blur", 4, list("type" = "blur", size=2))

#define WALL_PLANE 	1

#define OPENSPACE_LAYER 17 //Openspace layer over all
#define OPENSPACE_PLANE -9 //Openspace plane below all turfs
#define OPENSPACE_BACKDROP_PLANE -8

#define FLOOR_PLANE -7
#define REFLECTION_PLANE -6
#define GAME_PLANE -5
#define GAME_PLANE_RENDER_TARGET "GAME_PLANE_RENDER_TARGET"
#define GAME_PLANE_FOV_HIDDEN -4
#define GAME_PLANE_UPPER -3
#define WEATHER_EFFECT_PLANE -2
#define REFLECTION_PLANE_ABOVE -1
// RANDOM EFFECT PLANES (?)
#define GRAVITY_PULSE_PLANE -27
#define GRAVITY_PULSE_RENDER_TARGET "*GRAVPULSE_RENDER_TARGET"

#define FLOOR_PLANE_FOV_HIDDEN -3
#define SHADOW_LAYER 2.075
#define BLACKNESS_PLANE 0 //To keep from conflicts with SEE_BLACKNESS internals

#define SPACE_LAYER 1.8
//#define TURF_LAYER 2 //For easy recordkeeping; this is a byond define
#define MID_TURF_LAYER 2.02
#define HIGH_TURF_LAYER 2.03
#define TURF_PLATING_DECAL_LAYER 2.031
#define TURF_DECAL_LAYER 2.039 //Makes turf decals appear in DM how they will look inworld.
#define ABOVE_OPEN_TURF_LAYER 2.04
#define CLOSED_TURF_LAYER 2.05
#define BULLET_HOLE_LAYER 2.06
#define ABOVE_NORMAL_TURF_LAYER 2.08
#define LATTICE_LAYER 2.2
#define DISPOSAL_PIPE_LAYER 2.3
#define GAS_PIPE_HIDDEN_LAYER 2.35
#define WIRE_LAYER 2.4
#define WIRE_BRIDGE_LAYER 2.44
#define WIRE_TERMINAL_LAYER 2.45
#define GAS_SCRUBBER_LAYER 2.46
#define GAS_PIPE_VISIBLE_LAYER 2.47
#define GAS_FILTER_LAYER 2.48
#define GAS_PUMP_LAYER 2.49
#define LOW_OBJ_LAYER 2.5
#define LOW_SIGIL_LAYER 2.52
#define SIGIL_LAYER 2.54
#define HIGH_SIGIL_LAYER 2.56

#define BELOW_OPEN_DOOR_LAYER 2.6
#define BLASTDOOR_LAYER 2.65
#define OPEN_DOOR_LAYER 2.7
#define DOOR_HELPER_LAYER 2.71 //keep this above OPEN_DOOR_LAYER
#define PROJECTILE_HIT_THRESHHOLD_LAYER 2.75 //projectiles won't hit objects at or below this layer if possible
#define TABLE_LAYER 2.8
#define BELOW_OBJ_LAYER 2.9
#define LOW_ITEM_LAYER 2.95
//#define OBJ_LAYER 3 //For easy recordkeeping; this is a byond define
#define CLOSED_BLASTDOOR_LAYER 3.05
#define CLOSED_DOOR_LAYER 3.1
#define CLOSED_FIREDOOR_LAYER 3.11
#define SHUTTER_LAYER 3.12 // HERE BE DRAGONS
#define ABOVE_OBJ_LAYER 3.2
#define ABOVE_WINDOW_LAYER 3.3
#define SIGN_LAYER 3.4
#define NOT_HIGH_OBJ_LAYER 3.5
#define HIGH_OBJ_LAYER 3.6

#define BELOW_MOB_LAYER 3.7
#define LYING_MOB_LAYER 3.8
//#define MOB_LAYER 4 //For easy recordkeeping; this is a byond define
#define ABOVE_MOB_LAYER 4.1
#define WALL_OBJ_LAYER 4.25
#define EDGED_TURF_LAYER 4.3
#define ON_EDGED_TURF_LAYER 4.35
#define LARGE_MOB_LAYER 4.4
#define ABOVE_ALL_MOB_LAYER 4.5

#define SPACEVINE_LAYER 4.8
#define SPACEVINE_MOB_LAYER 4.9
//#define FLY_LAYER 5 //For easy recordkeeping; this is a byond define
#define GASFIRE_LAYER 5.05
#define RIPPLE_LAYER 5.1

#define GHOST_LAYER 6
#define LOW_LANDMARK_LAYER 9
#define MID_LANDMARK_LAYER 9.1
#define HIGH_LANDMARK_LAYER 9.2
//#define AREA_LAYER 10
#define MASSIVE_OBJ_LAYER 11
#define POINT_LAYER 12

#define WARN_LAYER 12.2

#define AREA_PLANE	12
#define AREA_LAYER	12

#define GRAIN_LAYER 13

#define WEATHER_PLANE 13

#define INDOOR_PLANE 14

#define LIGHTING_PLANE 15
#define LIGHTING_LAYER 15 //15

#define O_LIGHTING_VISUAL_PLANE 16
#define O_LIGHTING_VISUAL_LAYER 18
#define O_LIGHTING_VISUAL_RENDER_TARGET "O_LIGHT_VISUAL_PLANE"

#define LIGHTING_EXPOSURE_PLANE 16
#define LIGHTING_LAMPS_SELFGLOW 17 // Light sources glow (lamps, doors overlay, etc.)
#define LIGHTING_LAMPS_PLANE 4 // Light sources themselves (lamps, screens, etc.)
#define LIGHTING_LAMPS_GLARE 19
#define LIGHTING_LAMPS_RENDER_TARGET "*LIGHTING_LAMPS_RENDER_TARGET"
#define TRANSPARENT_FLOOR_PLANE -11 //Transparent plane that shows openspace underneath the floor

#define ABOVE_LIGHTING_PLANE 16
#define ABOVE_LIGHTING_LAYER 16

#define BYOND_LIGHTING_PLANE 18
#define BYOND_LIGHTING_LAYER 18

#define CAMERA_STATIC_PLANE 19
#define CAMERA_STATIC_LAYER 19

//HUD layer defines


#define FULLSCREEN_PLANE 20
#define FLASH_LAYER 20
#define FULLSCREEN_LAYER 20.1
#define UI_DAMAGE_LAYER 20.2
#define BLIND_LAYER 20.3
#define CRIT_LAYER 20.4
#define CURSE_LAYER 20.5
#define BACKHUD_LAYER 20.6

#define HUD_PLANE 21
#define HUD_LAYER 21
#define ABOVE_HUD_PLANE 22
#define ABOVE_HUD_LAYER 22

#define SPLASHSCREEN_LAYER 23
#define SPLASHSCREEN_PLANE 23

//-------------------- Rendering ---------------------
#define RENDER_PLANE_GAME 9990
#define RENDER_PLANE_GAME_RENDER_TARGET "RENDER_PLANE_GAME"
#define RENDER_PLANE_GAME_PROCESSING 9991
#define RENDER_PLANE_GAME_POST_PROCESSING 9992
#define RENDER_PLANE_NON_GAME 9995
#define RENDER_PLANE_NON_GAME_RENDER_TARGET "RENDER_PLANE_NON_GAME"
#define RENDER_PLANE_NON_GAME_PROCESSING 9996
#define RENDER_PLANE_NON_GAME_POST_PROCESSING 9997
#define RENDER_PLANE_PEEPER 9998
#define RENDER_PLANE_MASTER 9999
//----------------------------------------------------

///Plane master controller keys
#define PLANE_MASTERS_GAME "plane_masters_game"

#define FOV_EFFECTS_LAYER 10000

//---------- EMISSIVES -------------
//Layering order of these is not particularly meaningful.
//Important part is the seperation of the planes for control via plane_master

/// This plane masks out lighting to create an "emissive" effect, ie for glowing lights in otherwise dark areas.
#define EMISSIVE_PLANE 15
/// The render target used by the emissive layer.
#define EMISSIVE_RENDER_TARGET "*EMISSIVE_PLANE"
/// The layer you should use if you _really_ don't want an emissive overlay to be blocked.
#define EMISSIVE_LAYER_UNBLOCKABLE 999

#define EMISSIVE_UNBLOCKABLE_PLANE 17
#define EMISSIVE_UNBLOCKABLE_LAYER 17
#define EMISSIVE_UNBLOCKABLE_RENDER_TARGET "*EMISSIVE_UNBLOCKABLE_PLANE"

/// Yeah, FoV does require quite a few planes to work with 513 filters to a decent degree.
#define FIELD_OF_VISION_MASK_PLANE -1
#define FIELD_OF_VISION_MASK_RENDER_TARGET "FIELD_OF_VISION_MASK_PLANE"
#define FIELD_OF_VISION_MASK_LAYER 20
