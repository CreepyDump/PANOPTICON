#define STAT_MIN 1
#define STAT_MAX 20
#define STAT_DEFAULT 10

// List of all stats for easier iteration
GLOBAL_LIST_INIT(stat_types, list(
    "strength" = "STASTR",
    "perception" = "STAPER",
    "intelligence" = "STAINT",
    "constitution" = "STACON",
    "endurance" = "STAEND",
    "speed" = "STASPD",
    "fortune" = "STALUC"
))

// Buffer stats mapping
GLOBAL_LIST_INIT(stat_buffers, list(
    "strength" = "BUFSTR",
    "perception" = "BUFPER",
    "intelligence" = "BUFINT",
    "constitution" = "BUFCON",
    "endurance" = "BUFEND",
    "speed" = "BUFSPE",
    "fortune" = "BUFLUC"
))

/atom/movable/screen/stats
    name = "stats"
    icon = 'icons/mob/roguestats.dmi'
    icon_state = "stats"
    screen_loc = panopticon_stats
    var/static/overlay_x = 0
    var/static/overlay_y = 0
    var/mob/living/owner

    // Stat display offsets (y-axis)
    var/static/list/stat_to_y_offset = list(
        "fortune" = 0,
        "speed" = 10,
        "endurance" = 20,
        "constitution" = 30,
        "intelligence" = 40,
        "perception" = 50,
        "strength" = 60
    )

    var/list/stat_to_value = list()
    var/list/raw_stat_to_value = list()
    var/list/list/stat_to_number_overlays = list()
    var/list/image/all_number_overlays = list()

/atom/movable/screen/stats/Initialize(mapload, mob/living/ownr)
    . = ..()
    if(ownr)
        owner = ownr
    // Initialize stat lists
    for(var/stat in GLOB.stat_types)
        stat_to_value[stat] = "00"
        raw_stat_to_value[stat] = "00"
    update_from_owner()
    regen_overlays()
    update_icon()

/atom/movable/screen/stats/Destroy()
    owner = null
    QDEL_LIST(all_number_overlays)
    stat_to_number_overlays.Cut()
    return ..()

/atom/movable/screen/stats/proc/update_from_owner()
    if(!owner)
        return
    for(var/stat in GLOB.stat_types)
        var/base_stat = owner.vars[GLOB.stat_types[stat]]
        var/buffer_stat = owner.vars[GLOB.stat_buffers[stat]]
        stat_to_value[stat] = pad_number(base_stat)
        raw_stat_to_value[stat] = pad_number(base_stat + buffer_stat)
    regen_overlays()
    update_icon()

/atom/movable/screen/stats/proc/pad_number(num)
    num = clamp(round(num), STAT_MIN, STAT_MAX)
    return num < 10 ? "0[num]" : "[num]"

/atom/movable/screen/stats/update_overlays()
    . = ..()
    . |= all_number_overlays

/atom/movable/screen/stats/proc/regen_overlays()
    cut_overlays()
    QDEL_LIST(all_number_overlays)
    all_number_overlays = list()
    stat_to_number_overlays = list()

    for(var/stat_name in stat_to_value)
        var/num_value = text2num(stat_to_value[stat_name])
        var/raw_num_value = text2num(raw_stat_to_value[stat_name])
        var/y_off = stat_to_y_offset[stat_name]

        var/left = copytext(stat_to_value[stat_name], 1, 2)
        var/right = copytext(stat_to_value[stat_name], 2, 3)

        var/image/a = image(icon, src, "a[left]")
        var/image/b = image(icon, src, "a[right]")
        a.pixel_x = b.pixel_x = overlay_x
        a.pixel_y = b.pixel_y = overlay_y + y_off

        if(raw_num_value != num_value)
            var/image/buffer = image(icon, src, raw_num_value > num_value ? "up" : "down")
            buffer.pixel_x = overlay_x + 16
            buffer.pixel_y = overlay_y + y_off
            all_number_overlays += buffer
        stat_to_number_overlays[stat_name] = list(a, b)
        all_number_overlays += a
        all_number_overlays += b
