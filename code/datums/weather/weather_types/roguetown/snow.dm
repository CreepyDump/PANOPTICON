
/datum/weather/snow
	name = "snow"
	desc = ""

	telegraph_duration = 10 SECONDS
	telegraph_message = "<span class='warning'>The sky begins to weep.</span>"
	telegraph_sound = 'sound/blank.ogg'

	weather_message = ""
	weather_overlay = "snowfall_light"
	weather_duration_lower = 5 MINUTES
	weather_duration_upper = 12 MINUTES
	weather_sound = 'sound/blank.ogg'
	weather_alpha = 200

	probability = 3

	end_duration = 5 SECONDS
	end_message = ""
	end_sound = 'sound/blank.ogg'

	area_type = list(/area/panopticon/outdoors/necronox)
	protected_areas = list(/area/rogue/indoors,/area/rogue/outdoors,/area/panopticon/outdoors,/area/rogue/under,/area/panopticon/indoors)
	impacted_z_levels = list()
	var/lastlightning = 0

	particles = list(/atom/movable/screen/weather/snowfall)

/datum/weather/snow/New(z_levels)
	impacted_z_levels = GLOB.sky_z.Copy()
	. = ..()

/datum/weather/snow/weather_act(atom/A)
	if(isliving(A))
		var/mob/living/M = A
		M.adjust_fire_stacks(-25)
		return TRUE

/datum/weather/snow/get_used_state()
	switch(stage)
		if(STARTUP_STAGE)
			return "bla1"
//			return telegraph_overlay
		if(MAIN_STAGE)
			return pick("snowfall_light")
		if(WIND_DOWN_STAGE)
			return "bla2"
			return end_overlay
	return "bla3"

/datum/weather/snow/starteffected()
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

/datum/weather/snow/initialprocess()
	..()

/datum/weather/snow/process()
#ifndef TESTSERVER
	if(GLOB.forecast != "rain")
		wind_down()
		return
#endif
