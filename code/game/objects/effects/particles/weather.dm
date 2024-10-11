/particles/rain
		icon = 'icons/roguetown/misc/particles.dmi'
		icon_state	= list("rain"=5, "rain2"=5, "drop"=1)
//		icon_state	= list("rain1"=5, "rain2"=6, "rain3"=5)
		width 		= 928
		height 		= 928
		count 		= 400
		spawning 	= 400
		lifespan 	= 10
		fade 		= 0
//		fadein		= 0
		position 	= generator("box", list(-928,-928,0), list(928,928,0))
//		gravity 	= list(-1, -200)
		velocity = list(0, -200)

/obj/emitters
//	appearance_flags	= PIXEL_SCALE
//	screen_loc = "5.5,8"

/obj/emitters/weather //we are not put on the screen, but rather put into a vis contents for a client's image
	vis_flags = VIS_INHERIT_PLANE

/obj/emitters/weather/rain
	particles 	= new/particles/rain
//	alpha = 190

/obj/effect/realistic_fog
	alpha = 180
	icon = 'icons/mob/screen_full.dmi'
	icon_state = "fog"
	alpha = 0
	plane = GAME_PLANE
	layer = SPACEVINE_LAYER
	anchored = TRUE
	density = FALSE
	mouse_opacity = 0
	pixel_w = -96
	pixel_z = -96

/obj/effect/realistic_fog/New(client/C)
	. = ..()
	var/matrix/M = matrix()
	M.Translate(-480,0)
	animate(src, transform = M, time = 300, loop = -1)
	animate(transform = null, time = 0)

//	animate(MA, transform = null, time = 100, loop = -1)
//	animate(transform = MT, time = 0)
//	add_overlay(MA)

//	animate(transform = matrix(), time = 30)

/obj/screen/weather/snowfall
	alpha = 180
	icon = 'icons/mob/screen_gen.dmi'
	icon_state	= "snowfall_light"
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	mouse_opacity = 0
	plane = WEATHER_PLANE
