
///Called when the movable tries to change its dynamic light color setting, from base atom/movable/lighting_overlay_set_color(): (color)
#define COMSIG_MOVABLE_LIGHT_OVERLAY_SET_RANGE "movable_light_overlay_set_color"
///Called when the movable tries to change its dynamic light power setting, from base atom/movable/lighting_overlay_set_power(): (power)
#define COMSIG_MOVABLE_LIGHT_OVERLAY_SET_POWER "movable_light_overlay_set_power"
///Called when the movable tries to change its dynamic light range setting, from base atom/movable/lighting_overlay_set_range(): (range)
#define COMSIG_MOVABLE_LIGHT_OVERLAY_SET_COLOR "movable_light_overlay_set_range"
///Called when the movable tries to toggle its dynamic light LIGHTING_ON status, from base atom/movable/lighting_overlay_toggle_on(): (new_state)
#define COMSIG_MOVABLE_LIGHT_OVERLAY_TOGGLE_ON "movable_light_overlay_toggle_on"
///from base of mob/update_transform()
#define COMSIG_LIVING_POST_UPDATE_TRANSFORM "living_post_update_transform"

///from base of mob/living/HeadRape(): (amount, update, ignore)
#define COMSIG_LIVING_STATUS_HEADRAPE "living_headrape"
///from base of obj/projectile/process_hit(): (turf/T, atom/target, atom/bumped, hit_something = FALSE)
#define COMSIG_PROJECTILE_TRY_EMBED "projectile_try_embed"
///from base of mob/living/carbon/clear_wound_message():
#define COMSIG_CARBON_CLEAR_WOUND_MESSAGE "clear_wound_message"
///from base of mob/living/carbon/add_to_wound_message(): (new_message, clear_message)
#define COMSIG_CARBON_ADD_TO_WOUND_MESSAGE "add_to_wound_message"
