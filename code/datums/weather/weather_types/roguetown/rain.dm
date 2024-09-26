
/datum/weather/rain
	name = "rain"
	desc = ""

	telegraph_duration = 10 SECONDS
	telegraph_message = "<span class='warning'>The sky begins to weep.</span>"
	telegraph_sound = 'sound/blank.ogg'

	weather_message = ""
	weather_overlay = "rain1"
	weather_duration_lower = 5 MINUTES
	weather_duration_upper = 12 MINUTES
	weather_sound = 'sound/blank.ogg'
	weather_alpha = 200

	probability = 3

	end_duration = 5 SECONDS
	end_message = ""
	end_sound = 'sound/blank.ogg'

	area_type = list(/area/panopticon/outdoors,/area/rogue/outdoors)
	protected_areas = list(/area/rogue/indoors,/area/rogue/under,/area/panopticon/outdoors/necronox,/area/panopticon/indoors)
	impacted_z_levels = list()
	var/lastlightning = 0

	particles = list(/obj/emitters/weather/rain)

/datum/weather/rain/New(z_levels)
	impacted_z_levels = GLOB.sky_z.Copy()
	. = ..()

/datum/weather/rain/weather_act(atom/A)
	if(isliving(A))
		var/mob/living/M = A
		M.adjust_fire_stacks(-100)
		M.SoakMob(FULL_BODY)
		M.apply_status_effect(/datum/status_effect/raindrops)
		return TRUE
	var/datum/reagent/water/W = new()
	if(isobj(A))
		var/obj/O = A
		W.reaction_obj(O, 100)
	if(isopenturf(A))
		var/turf/open/T = A
		W.reaction_turf(T, 300)
	qdel(W)
	return ..()

/datum/weather/rain/get_used_state()
	switch(stage)
		if(STARTUP_STAGE)
			return "bla1"
//			return telegraph_overlay
		if(MAIN_STAGE)
			return pick("rain1", "rain2", "rain3", "rain4")
		if(WIND_DOWN_STAGE)
			return "bla2"
			return end_overlay
	return "bla3"

/datum/weather/rain/starteffected()
	..() //the parent does all living mobs already
//	for(var/mob/living/L in GLOB.mob_living_list)
//		if(can_weather_act(L))
//			SSweather.uniqueadd(L)
//			START_PROCESSING(SSweather, L)
//	for(var/obj/O in GLOB.rain_update)
//		if(can_weather_act(O))
//			SSweather.uniqueadd(O)
//			START_PROCESSING(SSweather, O)
//	for(var/obj/O in GLOB.fires_list)
//		if(can_weather_act(O))
//			START_PROCESSING(SSweather,O)

/datum/weather/rain/initialprocess()
	..()
//	for(var/turf/T in GLOB.dirt_list)
//		if(can_weather_act(T))
///			SSweather.uniqueadd(T, TRUE)
//			START_PROCESSING(SSweather, T)

/mob/living/carbon/proc/reset_lightning()
	if(lightning_flashing)
		lightning_flashing = FALSE
		update_sight()

/datum/weather/rain/process()
#ifndef TESTSERVER
	if(GLOB.forecast != "rain")
		wind_down()
		return
#endif
	if(world.time < lastlightning + 66 SECONDS)
		return
	lastlightning = world.time
	for(var/mob/living/carbon/M in GLOB.player_list)
		var/area/A = get_area(M)
		if(istype(A, /area/rogue/outdoors))
			M.playsound_local(M, pick('sound/ambience/noises/thunout (1).ogg','sound/ambience/noises/thunout (2).ogg','sound/ambience/noises/thunout (3).ogg','sound/ambience/noises/thunout (4).ogg'), 100, FALSE)
			M.lightning_flashing = TRUE
			M.update_sight()
			addtimer(CALLBACK(M, /mob/living/carbon.proc/reset_lightning), 1)
			continue
		if(istype(A, /area/rogue/indoors))
			M.playsound_local(M, pick('sound/ambience/noises/thunin (1).ogg','sound/ambience/noises/thunin (2).ogg','sound/ambience/noises/thunin (3).ogg','sound/ambience/noises/thunin (4).ogg'), 100, FALSE)
			continue
//	testing("dolightingflash")
//	for(var/obj/machinery/light/sun/L in GLOB.machines)
//		L.lightningflash()

/datum/weather/rain/start()
	. = ..()
	for(var/M in GLOB.player_list)
		if(isliving(M))
			var/mob/living/L = M
			if(L.client)
				SSdroning.play_rain(get_area(L), L.client)

/datum/weather/rain/end()
	. = ..()
	for(var/M in GLOB.player_list)
		if(isliving(M))
			var/mob/living/L = M
			if(L.client)
				SSdroning.kill_rain(L.client)

/datum/status_effect/raindrops
	id = "raindrops"
	duration = 3 SECONDS
	status_type = STATUS_EFFECT_REFRESH
	/// Fullscreen effect used to provide the visual to that player and only that player
	var/obj/screen/fullscreen/raindrops/holder

/datum/status_effect/raindrops/on_creation(mob/living/new_owner, ...)
	. = ..()
	holder = new_owner.overlay_fullscreen("raindrops", /obj/screen/fullscreen/raindrops)

/datum/status_effect/raindrops/tick(delta_time, times_fired) //happening here for now
	. = ..()
	tick_interval = rand(0, 5) //next drop happens in a random amount of time
	for(var/i in rand(1,2))
		droplet()

/datum/status_effect/raindrops/proc/droplet()
	var/obj/effect/temp_visual/raindrops/onedrop = new(owner) //put it inside the mob so it follows the player as they move
	onedrop.pixel_x += rand(-80, 480)
	onedrop.pixel_y += rand(-80, 480) //get put somewhere randomly on the screen
	//because it's a downscaled large image, it starts out in the bottom left corner by default
	holder.vis_contents += onedrop

/datum/status_effect/raindrops/refresh(effect, ...) //also spawn a droplet every time we're refreshed, makes the rain look far more dense if we're standing outside
	for(var/i in rand(1,2))
		droplet()
	return ..()

/datum/status_effect/raindrops/on_remove()
	owner.clear_fullscreen("raindrops")
	if(holder && !QDELETED(holder))
		qdel(holder)
	return ..()

/**
 * This provides the images to only the person with it
 */
/obj/screen/fullscreen/raindrops
	icon_state = "raindrops"
	appearance_flags = PIXEL_SCALE | RESET_TRANSFORM
	plane = GRAVITY_PULSE_PLANE 

/**
 * this is an individual raindrop, multiple of these are spawned and added to the fullscreen to emulate random raindrops
 */
/obj/effect/temp_visual/raindrops
	plane = GRAVITY_PULSE_PLANE
	icon = 'icons/effects/160x160.dmi' //massive picture for smoother edges
	icon_state = "raindrop"
	appearance_flags = PIXEL_SCALE | RESET_TRANSFORM
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	duration = (0.8 SECONDS) //fades out over this time, not too long, not too slow

/obj/effect/temp_visual/raindrops/Initialize(mapload)
	. = ..()
	transform = matrix()/5 //we do this so it can larger if needed
	animate(src, alpha = 0, time = duration)
