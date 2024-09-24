/////////////////////////////////////////////
//SPARK SYSTEM (like steam system)
// The attach(atom/atom) proc is optional, and can be called to attach the effect
// to something, like the RCD, so then you can just call start() and the sparks
// will always spawn at the items location.
/////////////////////////////////////////////

/atom/proc/spark_act()
	return

/proc/do_sparks(n, c, source)
	// n - number of sparks
	// c - cardinals, bool, do the sparks only move in cardinal directions?
	// source - source of the sparks.

	var/datum/effect_system/spark_spread/sparks = new
	sparks.set_up(n, c, source)
	sparks.autocleanup = TRUE
	sparks.start()

/obj/effect/particle_effect/sparks
	name = "sparks"
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks2"
	anchored = TRUE
	 
	light_range = 1
	light_power = 0.5
	light_color = LIGHT_COLOR_FIRE
	pixel_x = 0
	pixel_y = 0
	layer = ABOVE_LIGHTING_LAYER
	plane = ABOVE_LIGHTING_PLANE

/obj/effect/particle_effect/sparks/Initialize()
	..()
	dir = pick(GLOB.cardinals)
	pixel_x = rand(-2, 2)
	pixel_y = rand(-2, 2)
	icon_state = "sparks[rand(1, 2)]"
	transform = turn(transform,rand(0,360))
	alpha = rand(55,255)
	return INITIALIZE_HINT_LATELOAD

/obj/effect/particle_effect/sparks/LateInitialize()
	flick(icon_state, src) // replay the animation
//	playsound(src, "sparks", 100, TRUE)
	var/turf/T = loc
	if(isturf(T))
		T.hotspot_expose(1000,100)
		for(var/A in T)
			var/atom/AT = A
			if(!QDELETED(AT) && AT != src)
				AT.spark_act()

	QDEL_IN(src, 2 SECONDS)
	animation_destruction_fade(src, speed = 1)

/obj/effect/particle_effect/sparks/Destroy()
	var/turf/T = loc
	if(isturf(T))
		T.hotspot_expose(1000,100)
		for(var/A in T)
			var/atom/AT = A
			if(!QDELETED(AT) && AT != src)
				AT.spark_act()
	set_light_on(FALSE)
	return ..()

/obj/effect/particle_effect/sparks/Move()
	..()
	var/turf/T = loc
	if(isturf(T))
		T.hotspot_expose(1000,100)
		for(var/A in T)
			var/atom/AT = A
			if(!QDELETED(AT) && AT != src)
				AT.spark_act()

/obj/effect/particle_effect/sparks/large // WIP
	name = "sparks"
	icon = 'icons/effects/64x64.dmi'
	icon_state = "sparks"
	light_range = 2
	light_power = 1.5
	pixel_x = -14
	pixel_y = -14
	pixel_w = -14 // pixel_x
	pixel_z = -14 // pixel_y

/obj/effect/particle_effect/sparks/large/Initialize()
	..()

//	icon_state/I
//	I.pixel_x = -14
//	I.pixel_y = -14

//	set_light(7, l_color = LIGHT_COLOR_FIRE)

	dir = pick(GLOB.cardinals)
	icon_state = "sparks"
	transform = turn(transform,rand(0,360))
	alpha = rand(55,255)
	return INITIALIZE_HINT_LATELOAD

/datum/effect_system/spark_spread
	effect_type = /obj/effect/particle_effect/sparks

/datum/effect_system/spark_spread/large
	effect_type = /obj/effect/particle_effect/sparks/large

/datum/effect_system/spark_spread/quantum
	effect_type = /obj/effect/particle_effect/sparks/quantum



// CUSTOM SPARK EFFECTS FOR WHEN DOING ACTIONS THAT WOULD CREATE SPARKS //

// SPARKS FROM IMPACT OF HITTING A ANVIL EFFECT //
/obj/effect/particle_effect/sparks/anvil
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparkanvil"
	anchored = TRUE
	 
	light_range = 1
	light_power = 1
	light_color = LIGHT_COLOR_FIRE
	pixel_x = 0
	pixel_y = 0
	layer = ABOVE_LIGHTING_LAYER
	plane = ABOVE_LIGHTING_PLANE

/obj/effect/particle_effect/sparks/anvil/Initialize()
	..()
	dir = pick(GLOB.cardinals)
	icon_state = "sparkanvil[rand(1, 2)]"
	pixel_x = rand(-2, 2)
	pixel_y = rand(-2, 2)
	transform = turn(transform,rand(0,360))
	alpha = rand(55,255)
	return INITIALIZE_HINT_LATELOAD

/obj/effect/particle_effect/sparks/anvil/LateInitialize()
	flick(icon_state, src)
	var/turf/T = loc
	if(isturf(T))
		T.hotspot_expose(1000,100)
		for(var/A in T)
			var/atom/AT = A
			if(!QDELETED(AT) && AT != src)
				AT.spark_act()

	QDEL_IN(src, 2 SECONDS) // 10
	animation_destruction_fade(src, speed = 1)

/obj/effect/particle_effect/sparks/anvil/single
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks1"

/obj/effect/particle_effect/sparks/anvil/single/Initialize()
	..()
	dir = pick(GLOB.cardinals)
	icon_state = "sparks[rand(1, 2)]"
	pixel_x = rand(-3, 3)
	pixel_y = rand(-3, 3)
	transform = turn(transform,rand(0,360))
	alpha = rand(55,255)
	return INITIALIZE_HINT_LATELOAD

/datum/effect_system/spark_spread/anvil
	effect_type = /obj/effect/particle_effect/sparks/anvil

/datum/effect_system/spark_spread/anvil/single
	effect_type = /obj/effect/particle_effect/sparks/anvil/single

/obj/proc/anvil_spark_hot(mob/living/user)
	if(user)
		var/datum/effect_system/spark_spread/anvil/S = new()
		var/turf/front = get_turf(src)
		S.set_up(1, 1, front)
		S.start()

/obj/proc/anvil_spark_cold(mob/living/user)
	if(user)
		var/datum/effect_system/spark_spread/anvil/single/S = new()
		var/turf/front = get_turf(src)
		S.set_up(1, 1, front)
		S.start()



// SPARKS FROM GRINDING EFFECT FOR FLINTSPARKERS OR SHARPENING A BLADE ETC //
/obj/effect/particle_effect/sparks/grind
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks1"
	anchored = TRUE
	 
	light_range = 1
	light_power = 0.5
	light_color = LIGHT_COLOR_FIRE
	pixel_x = 0
	pixel_y = 0
	layer = ABOVE_LIGHTING_LAYER
	plane = ABOVE_LIGHTING_PLANE

/obj/effect/particle_effect/sparks/grind/Initialize()
	..()
	dir = pick(GLOB.cardinals)
	icon_state = "sparks[rand(1, 2)]"
	transform = turn(transform,rand(0,360))
	alpha = rand(55,255)
	return INITIALIZE_HINT_LATELOAD

/obj/effect/particle_effect/sparks/grind/LateInitialize()
	flick(icon_state, src)
	var/turf/T = loc
	if(isturf(T))
		T.hotspot_expose(1000,100)
		for(var/A in T)
			var/atom/AT = A
			if(!QDELETED(AT) && AT != src)
				AT.spark_act()

	QDEL_IN(src, 1 SECONDS)
	animation_destruction_fade(src, speed = 1)

/obj/effect/particle_effect/sparks/grind/north
	pixel_y = -24
	layer = BELOW_MOB_LAYER
	plane = GAME_PLANE

/obj/effect/particle_effect/sparks/grind/east
	pixel_x = -25
	pixel_y = -2
	layer = ABOVE_MOB_LAYER

/obj/effect/particle_effect/sparks/grind/east/sword
	pixel_x = -17
	pixel_y = -9
	layer = ABOVE_MOB_LAYER

/obj/effect/particle_effect/sparks/grind/south
	pixel_y = 26
	layer = ABOVE_MOB_LAYER

/obj/effect/particle_effect/sparks/grind/west
	pixel_x = 25
	pixel_y = -2
	layer = ABOVE_MOB_LAYER

/obj/effect/particle_effect/sparks/grind/west/sword
	pixel_x = 17
	pixel_y = -9
	layer = ABOVE_MOB_LAYER

/obj/effect/particle_effect/sparks/grind/wheel
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks1"
	anchored = TRUE
	light_range = 1
	light_power = 1

/obj/effect/particle_effect/sparks/grind/wheel/Initialize()
	..()
	dir = pick(GLOB.cardinals)
	icon_state = "sparks[rand(1, 2)]"
	pixel_x = rand(-2, 2)
	pixel_y = rand(-2, 2)
	transform = turn(transform,rand(0,360))
	alpha = rand(55,255)
	return INITIALIZE_HINT_LATELOAD

/obj/effect/particle_effect/sparks/ground
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks1"
	anchored = TRUE
	light_range = 1
	light_power = 1

/obj/effect/particle_effect/sparks/ground/Initialize()
	..()
	dir = pick(GLOB.cardinals)
	icon_state = "sparks[rand(1, 2)]"
	pixel_x = rand(-2, 2)
	pixel_y = rand(-2, 2)
	transform = turn(transform,rand(0,360))
	alpha = rand(55,255)
	return INITIALIZE_HINT_LATELOAD

/datum/effect_system/spark_spread/grind
	effect_type = /obj/effect/particle_effect/sparks/grind

/datum/effect_system/spark_spread/grind/north
	effect_type = /obj/effect/particle_effect/sparks/grind/north

/datum/effect_system/spark_spread/grind/east
	effect_type = /obj/effect/particle_effect/sparks/grind/east

/datum/effect_system/spark_spread/grind/east/sword
	effect_type = /obj/effect/particle_effect/sparks/grind/east/sword

/datum/effect_system/spark_spread/grind/south
	effect_type = /obj/effect/particle_effect/sparks/grind/south

/datum/effect_system/spark_spread/grind/west
	effect_type = /obj/effect/particle_effect/sparks/grind/west

/datum/effect_system/spark_spread/grind/west/sword
	effect_type = /obj/effect/particle_effect/sparks/grind/west/sword

/datum/effect_system/spark_spread/grind/wheel
	effect_type = /obj/effect/particle_effect/sparks/grind/wheel

/datum/effect_system/spark_spread/ground
	effect_type = /obj/effect/particle_effect/sparks/ground

/obj/item/proc/grind_spark(mob/living/user)

	if(user.dir == NORTH)
		var/datum/effect_system/spark_spread/grind/north/S = new()
		var/turf/front = get_step(user,user.dir)
		S.set_up(1, 1, front)
		S.start()

	if(user.dir == EAST)
		var/datum/effect_system/spark_spread/grind/east/S = new()
		var/turf/front = get_step(user,user.dir)
		S.set_up(1, 1, front)
		S.start()

	if(user.dir == SOUTH)
		var/datum/effect_system/spark_spread/grind/south/S = new()
		var/turf/front = get_step(user,user.dir)
		S.set_up(1, 1, front)
		S.start()

	if(user.dir == WEST)
		var/datum/effect_system/spark_spread/grind/west/S = new()
		var/turf/front = get_step(user,user.dir)
		S.set_up(1, 1, front)
		S.start()

/obj/item/proc/grind_spark_sword(mob/living/user)

	if(user.dir == NORTH)
		var/datum/effect_system/spark_spread/grind/north/S = new()
		var/turf/front = get_step(user,user.dir)
		S.set_up(1, 1, front)
		S.start()

	if(user.dir == EAST)
		var/datum/effect_system/spark_spread/grind/east/sword/S = new()
		var/turf/front = get_step(user,user.dir)
		S.set_up(1, 1, front)
		S.start()

	if(user.dir == SOUTH)
		var/datum/effect_system/spark_spread/grind/south/S = new()
		var/turf/front = get_step(user,user.dir)
		S.set_up(1, 1, front)
		S.start()

	if(user.dir == WEST)
		var/datum/effect_system/spark_spread/grind/west/sword/S = new()
		var/turf/front = get_step(user,user.dir)
		S.set_up(1, 1, front)
		S.start()

/obj/proc/wheel_spark(mob/living/user)
	if(user)
		var/datum/effect_system/spark_spread/grind/wheel/S = new()
		var/turf/front = get_turf(src)
		S.set_up(1, 1, front)
		S.start()

/obj/item/proc/ground_spark(mob/living/user)
		var/datum/effect_system/spark_spread/ground/S = new()
		var/turf/front = get_turf(src)
		S.set_up(1, 1, front)
		S.start()





//electricity

/obj/effect/particle_effect/sparks/electricity
	name = "lightning"
	icon_state = "electricity"

/obj/effect/particle_effect/sparks/quantum
	name = "quantum sparks"
	icon_state = "quantum_sparks"

/datum/effect_system/lightning_spread
	effect_type = /obj/effect/particle_effect/sparks/electricity
