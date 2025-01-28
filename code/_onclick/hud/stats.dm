/atom/movable/screen/stats
	name = "stats"
	icon = 'icons/mob/roguestats.dmi'
	icon_state = "stats"
	screen_loc = panopticon_stats
	var/static/overlay_x = 0
	var/static/overlay_y = 0
	var/static/list/stat_to_y_offset = list(
		STALUC = 0,
		STASPD = 10,
		STAEND = 20,
		STACON = 30,
		STAINT = 40,
		STAPER = 50,
		STASTR = 60,
	) //This is dumb. Stat's path = stat's offset.
	var/list/stat_to_value = list(
		STALUC = "00",
		STASPD = "00",
		STAEND = "00",
		STACON = "00",
		STAINT = "00",
		STAPER = "00",
		STASTR = "00",
	) //Stat's path to it's value - easier than getting it always
	var/list/raw_stat_to_value = list(
		STALUC = "00",
		STASPD = "00",
		STAEND = "00",
		STACON = "00",
		STAINT = "00",
		STAPER = "00",
		STASTR = "00",
	) //Stat's path to it's value - easier than getting it always
	var/list/list/stat_to_number_overlays = list()
	var/list/image/all_number_overlays = list()

/atom/movable/screen/stats/update_overlays()
	. = ..()
	. |= all_number_overlays

/atom/movable/screen/stats/Initialize(mapload)
	. = ..()
	regen_overlays()
	update_icon()

/atom/movable/screen/stats/proc/regen_overlays()
	cut_overlays()
	QDEL_LIST(all_number_overlays)
	all_number_overlays = list()
	for(var/stat_path in stat_to_value)
		var/num_value = text2num(stat_to_value[stat_path])
		var/raw_num_value = text2num(raw_stat_to_value[stat_path])
		var/y_off = stat_to_y_offset[stat_path]
		var/left = copytext(stat_to_value[stat_path], 1, 2)
		var/right = copytext(stat_to_value[stat_path], 2)
		var/image/a = image(icon, src, "a[left]")
		var/image/b = image(icon, src, "b[right]")
		a.pixel_x = b.pixel_x = overlay_x
		a.pixel_y = b.pixel_y = overlay_y + y_off
		stat_to_number_overlays[stat_path] = list(a, b)
		all_number_overlays |= stat_to_number_overlays[stat_path]

	if(length(all_number_overlays))
		return all_number_overlays

/atom/movable/screen/stats/proc/stat_number_to_string(value)
	value = clamp(CEILING(value, 1), 0, 99)
	. = "[value]"
	if(length(.) < 2)
		. = "0[.]"
